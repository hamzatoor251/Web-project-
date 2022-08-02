<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Web_Project_Datatable.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/iquery-3.4.1.min.js"></script> 
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity "sha384-AYMECBYW5cVb3ZcuHt0193w35dYTsvhLPVnYs9eStHfG /> 
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" /> 
    <script type="text/javascript" src="//cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function{
            $.ajax({
                url: 'Admin.aspx/GetEmployees',
                method: 'post',
                dataType: 
                data: JSON.stringify({ "inputValue": name }),
                contentType: 'application/json',
                async: false,
                success: function (data) {
                    var Name = document.getElementById("Name");
                    var Age = document.getElementById("Age");
                    var Class = document.getElementById("Class");
                    Name.innerHTML = ("Name: " + data.d["Name"]);
                    Age.innerHTML = ("ID: " + data.d["ID"]);
                    Class.innerHTML = ("Class: " + data.d["Class"]);
            })
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="myTable">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>ID</th>
                        <th>Edit</th>
                    </tr>
                </thead>
            </table>
        </div>
    </form>
</body>
</html>
