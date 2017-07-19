# Open connection
function getConn(){
	$Connection = New-Object System.Data.SQLClient.SQLConnection
    $Connection.ConnectionString = "database='master';trusted_connection=true;"
    $Connection.Open()
    return $connection
}

# Function to execute query at database
function principalMirrorCount () {
    $Datatable = New-Object System.Data.DataTable
    
	$Connection = getConn
    $Command = New-Object System.Data.SQLClient.SQLCommand
    $Command.Connection = $Connection
    $Command.CommandText = $("SELECT count(0) as total FROM sys.database_mirroring where mirroring_role_desc = 'PRINCIPAL'")

    $DataAdapter = new-object System.Data.SqlClient.SqlDataAdapter $Command
    $Dataset = new-object System.Data.Dataset
    $DataAdapter.Fill($Dataset)
    $Connection.Close()
    
#	Write-Host $Dataset.Tables[0].Rows[0][0]
    return $Dataset.Tables[0].Rows[0][0]
}

# Call function to execute query
$dbQueryResult = principalMirrorCount

# Get value from total returned by query
$principalMirrorCount = $dbQueryResult[1]

# Print for debugging
Write-Host $principalMirrorCount
