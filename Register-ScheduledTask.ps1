# Obtener la ruta actual
$Path = $PWD.Path
# Obtener el año actual
$Year = (Get-Date).Year

# Eliminar tareas si ya existen
$taskNames = @(
    "Fichaje Entrada",
    "Fichaje Salida Enero-Julio",
    "Fichaje Viernes Salida Enero-Julio",
    "Fichaje Salida Julio-Agosto",
    "Fichaje Salida Septiembre-Diciembre",
    "Fichaje Viernes Salida Septiembre-Diciembre"
)

foreach ($task in $taskNames) {
    if (Get-ScheduledTask -TaskName $task -ErrorAction SilentlyContinue) {
        Unregister-ScheduledTask -TaskName $task -Confirm:$false
    }
}

# Definir la acción para ejecutar el script PowerShell
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File `"$Path\sign.ps1`""

# Crear disparadores válidos
$fichajeEntrada = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday, Tuesday, Wednesday, Thursday, Friday -WeeksInterval 1 -At "08:00AM"
$fichajeJornadaNormal = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday, Tuesday, Wednesday, Thursday -WeeksInterval 1 -At "17:01PM"
$fichajeViernesJornadaNormal = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Friday -WeeksInterval 1 -At "15:31PM"
$fichajeJornadaIntensiva = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday, Tuesday, Wednesday, Thursday, Friday -WeeksInterval 1 -At "15:01PM"

# Configurar las opciones de la tarea
$executionTimeLimit = New-TimeSpan -Hours 1
$settings = New-ScheduledTaskSettingsSet -ExecutionTimeLimit $executionTimeLimit -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable

# Registrar la tarea de fichaje de entrada
Register-ScheduledTask -TaskName "Fichaje Entrada" -Action $action -Trigger $fichajeEntrada -Description "Ejecuta el fichaje de entrada en la plataforma." -Settings $settings
# Registrar las tareas de fichaje de salida Enero-Julio
Register-ScheduledTask -TaskName "Fichaje Salida Enero-Julio" -Action $action -Trigger $fichajeJornadaNormal -Description "Ejecuta el fichaje de salida de lunes a jueves de Enero a Julio." -Settings $settings
# Registrar las tareas de fichaje de salida los viernes de Enero-Julio
Register-ScheduledTask -TaskName "Fichaje Viernes Salida Enero-Julio" -Action $action -Trigger $fichajeViernesJornadaNormal -Description "Ejecuta el fichaje de salida los viernes de Enero a Julio." -Settings $settings
# Registrar la tarea de fichaje de salida en jornada intensiva
Register-ScheduledTask -TaskName "Fichaje Salida Julio-Agosto" -Action $action -Trigger $fichajeJornadaIntensiva -Description "Ejecuta el fichaje de salida en jornada intensiva." -Settings $settings
# Registrar las tareas de fichaje de salida Septiembre-Diciembre
Register-ScheduledTask -TaskName "Fichaje Salida Septiembre-Diciembre" -Action $action -Trigger $fichajeJornadaNormal -Description "Ejecuta el fichaje de salida de lunes a jueves de Septiembre a Diciembre." -Settings $settings
# Registrar las tareas de fichaje de salida los viernes de Septiembre-Diciembre
Register-ScheduledTask -TaskName "Fichaje Viernes Salida Septiembre-Diciembre" -Action $action -Trigger $fichajeViernesJornadaNormal -Description "Ejecuta el fichaje de salida los viernes de Septiembre a Diciembre." -Settings $settings

# Establecer el StartBoundary (fecha de inicio)
$startBoundary = @{
    "Fichaje Entrada"                             = "$Year-01-01T08:00:00"
    "Fichaje Salida Enero-Julio"                  = "$Year-01-01T17:01:00"
    "Fichaje Viernes Salida Enero-Julio"          = "$Year-01-01T15:31:00"
    "Fichaje Salida Julio-Agosto"                 = "$Year-07-15T15:01:00"
    "Fichaje Salida Septiembre-Diciembre"         = "$Year-09-01T17:01:00"
    "Fichaje Viernes Salida Septiembre-Diciembre" = "$Year-09-01T15:31:00"
}
# Establecer el EndBoundary (fecha de finalización)
$endBoundaries = @{
    "Fichaje Entrada"                             = "$Year-12-31T23:59:00"
    "Fichaje Salida Enero-Julio"                  = "$Year-07-14T23:59:00"
    "Fichaje Viernes Salida Enero-Julio"          = "$Year-07-14T23:59:00"
    "Fichaje Salida Julio-Agosto"                 = "$Year-08-31T23:59:00"
    "Fichaje Salida Septiembre-Diciembre"         = "$Year-12-31T23:59:00"
    "Fichaje Viernes Salida Septiembre-Diciembre" = "$Year-12-31T23:59:00"
}

# Actualizar los límites de finalización de las tareas
foreach ($task in $taskNames) {
    $taskObj = Get-ScheduledTask -TaskName $task -ErrorAction SilentlyContinue
    if ($taskObj) {
        $taskObj.Triggers | ForEach-Object {
            $_.StartBoundary = $startBoundary[$task]
            $_.EndBoundary = $endBoundaries[$task]
        }
        Set-ScheduledTask -TaskName $taskObj.TaskName -Trigger $taskObj.Triggers
    }
}

# Verificar que las tareas se han creado correctamente
foreach ($task in $taskNames) {
    Get-ScheduledTask -TaskName $task
}
