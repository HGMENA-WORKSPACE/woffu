# URL de la API
$url        = "https://glinttespana.woffu.com/api/svc/signs/signs"
$latitude   = 40.416729 # Cambiar por la latitud de tu ubicación
$longitude  = -3.703339 # Cambiar por la longitud de tu ubicación
$clck       = "XXXXXXXXXXXXXXXXXXXXXXXXXXX"
$gcl_au     = "0.0.0000000000.0000000000"
$uetsid     = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
$uetvid     = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
$clsk       = "XXX0XX%0X0000000000000%0X0%0X0%0XX.XXXXXXX.XX%0XXXXXXXX"
$token      = "XXXXXXXXXXXXXXX0XXXXXXX0XXX0XXXXXXX0.XXX0XXXXXXXXXXXXXXX0XXXXXXXXXX0XXX0XXXXXXX00XXXXX0XXXX0XX00XXXXXXX0XXXXXXXXXXXX0XXXXXX00XXX0XXXXXXXXXXXXXX00XXX0XXXXXXX0XXXXXXXXX00XXX00XXXXXXXXXXXXXXXXXXXXXXXXXXX0XXX0XXX0XXXXXXXXXXXXXXX0XXX0XXX0XX00XXX0XXXXXXXXXXXXXX0XXXXXX0X0XXXXXXXXXXXXXXXXXXX0XXXXXXX0XXXXXXX0XXX0XXX0XXXXXXXXXXXXXXX0XXXXXXX0XXXXXXX0XXXXX0XXXXXXX0XXXXXXXXXXX0XXXXXXXXXXXXXXXXXXXXXXXXXXX0XXXXX0XXXXXX0XXX.XX0XXX0XXXXXX0XXXXXXX-X0XXXXXXXXX0XX_00XXX0"

# Headers de la petición
$headers = @{
    "accept"             = "application/json, text/plain, */*"
    "accept-language"    = "en-GB,en;q=0.9,en-US;q=0.8,es-ES;q=0.7,es;q=0.6"
    "authorization"      = "Bearer $token"
    "cache-control"      = "no-cache"
    "content-type"       = "application/json"
    "pragma"             = "no-cache"
    "priority"           = "u=1, i"
    "sec-ch-ua"          = "`"Microsoft Edge`";v=`"131`", `"Chromium`";v=`"131`", `"Not_A Brand`";v=`"24`""
    "sec-ch-ua-mobile"   = "?0"
    "sec-ch-ua-platform" = "`"Windows`""
    "sec-fetch-dest"     = "empty"
    "sec-fetch-mode"     = "cors"
    "sec-fetch-site"     = "same-origin"
    "cookie"             = "_gcl_au=$gcl_au; woffu.token=$token; user-language=`"es`"; woffu.lang=es; _uetsid=$uetsid; _uetvid=$uetvid; _clck=$clck; _clsk=$clsk"
    "Referer"            = "https://glinttespana.woffu.com/v2/personal/dashboard/user"
    "Referrer-Policy"    = "strict-origin-when-cross-origin"
}

# Cuerpo de la petición
$body = @{
    "agreementEventId" = $null
    "requestId"        = $null
    "deviceId"         = "WebApp"
    "latitude"         = $latitude # Cambiar por la latitud de tu ubicación
    "longitude"        = $longitude # Cambiar por la longitud de tu ubicación
    "timezoneOffset"   = -60
} | ConvertTo-Json

# Función para registrar inicio/fin de jornada
function Registrar-Jornada {
    try {
        $response = Invoke-RestMethod -Uri $url -Method Post -Headers $headers -Body $body
        # Mostrar los resultados en la consola
        Write-Host  $response | Format-List -ForegroundColor Green
    }
    catch {
        # Mostrar los resultados en la consola
        Write-Host $_.Exception.Message -ForegroundColor Red
    }
    Write-Host (Get-Date) -ForegroundColor Yellow
    Write-Host "Press any key ...." -ForegroundColor Yellow
    [System.Console]::ReadKey() > $null
}

# Llamar a la función para registrar inicio/fin de jornada
Registrar-Jornada