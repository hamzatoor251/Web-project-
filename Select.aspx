<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Select.aspx.cs" Inherits="Web_Project_Datatable.Select_" %>


<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="p-3 mb-2 bg-secondary text-white" style="margin:5vw; height:35vw">
                <div class="d-flex justify-content-center text-center">
                    <div class="row">
                        <div class="col-12" >
                         <h1 style="margin:5vw">Select User</h1>
                        </div>
                        <div class="col-6 ">
                             <asp:Button runat="server" ID="Admin" class="btn btn-warning btn-lg " OnClick="Admin_Click" text="Admin" value="Admin" style="padding:10% 30%; margin: 5vw 5vw 0 0"/>
                              
                        </div>
                        <div class="col-6">
                            <asp:Button runat="server" ID="Accountant" class="btn btn-warning btn-lg" OnClick="Accountant_Click" text="Accountant" value="Accountant" style="padding:10% 30%; margin:5vw 0 0 5vw" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
