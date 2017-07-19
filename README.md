# Principal Databases Count

This is a Powershell script to check total of principal mirror databases at current server. 
  - It only connect at local server
  - Works for MSSQL Server
  - Connect to server using current active Windows user

### Running

Open a POSH session and enable execution policy:
```posh
$ Set-ExecutionPolicy RemoteSigned
```
Run script:
```sh
$ posh-get-mssql-principal-count.ps1
```


### Todos
 - Increase use of parameters to allow multiple servers execution
 - Add Night Mode

License
----

MIT


**Free Software, Hell Yeah!**
