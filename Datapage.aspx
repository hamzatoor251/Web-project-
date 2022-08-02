<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Datapage.aspx.cs" Inherits="Web_Project_Datatable.Datapage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" />
    <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <script type="text/javascript">
        var emptyRow = "<tr><td colspan='4' class='text-center'></td></tr>";
        var emptyNewRow = "<tr class='trNewRow'>";
        emptyNewRow += "        <td></td> ";
        emptyNewRow += "    <td class='tdName'>";
        emptyNewRow += "        <input  type='text' ID='tddName' class='form-control txtName' placeholder='Enter Name'/>";
        emptyNewRow += "    </td>";
        emptyNewRow += "    <td class='tdPassword'>";
        emptyNewRow += "        <input type='text'  ID='tddPassword' class='form-control txtPassword' placeholder='Enter Password'/>";
        emptyNewRow += "    </td>";
        emptyNewRow += "    <td class='tdEmail'>";
        emptyNewRow += "        <input type='text'  ID='tddEmail' class='form-control txtEmail' placeholder='Enter Email'/>";
        emptyNewRow += "    </td>";
        emptyNewRow += "    <td class='tdAction'>";
        emptyNewRow += "        <button class='btn btn-sm btn-success btn-save'> Save</button>";
        emptyNewRow += "        <button class='btn btn-sm btn-success btn-cancel'> Cancel</button>";
        emptyNewRow += "    </td>";
        emptyNewRow += "</tr>";
        var rowButtons = "<button class='btn btn-success btn-sm btn-edit' > Edit </button>  <button class='btn btn-danger btn-sm' > Delete </button> ";
        var rowUpdateButtons = "<button class='btn btn-success btn-sm btn-save' > Update </button>  <button class='btn btn-danger btn-sm btn-save' > Cancel </button> ";
        var rowEditButtons = "<button class='btn btn-success btn-sm btn-update' > Update </button>  <button class='btn btn-danger btn-sm btn-save' > Cancel </button> ";


        $(document).ready(function () {
            var AccTable = document.getElementById("AccTable");
            let hdnUser = document.getElementById("hdnUser").value;
            var BillBtn = document.getElementById("BillBtn");



            if (hdnUser == "Admin") {
                debugger
                AccTable.innerHTML = '<h2>Accountants</h2><table id="myTable" class="table table-hover table-dark"><thead><tr><th>ID</th><th>Name</th><th>Email</th><th class="tdAction">Edit</th></tr></thead><tbody></tbody ></table ><input type="button" id="btnAdd" class="btn btn-primary para" value="Add New Accountant" /> ';
                firstTable();
                //$("#myTable").append(emptyRow);
                $("#btnAdd").click(function () {
                    ////debugger;
                    if ($("#tblData tbody").children().children().length == 1) {
                        $("#tblData tbody").html("");
                    }
                    //debugger;
                    $("#myTable").append(emptyNewRow); // appending dynamic string to table tbody
                });
                $("#myTable").on('click', '.btn-save', function () {
                    var Email = $(this).parent().parent().find(".txtEmail").val();
                    //$(this).parent().parent().find(".tdEmail").html("" + Email + "");
                    var Name = $(this).parent().parent().find(".txtName").val();
                    //$(this).parent().parent().find(".tdName").html("" + Name + "");
                    var password = $(this).parent().parent().find(".txtPassword").val();
                    //$(this).parent().parent().find(".tdPassword").html("");
                    //$(this).parent().parent().find(".tdAction").html(rowButtons);


                    //if (car == "") { return };
                    $.ajax({
                        url: 'Datapage.aspx/AddAcc',
                        type: 'post',
                        data: JSON.stringify({ "Name": Name, "Email": Email, "Password": password }),
                        contentType: 'application/json',
                        async: false,
                        success: function (data) {
                            if (data.d) {
                                alert("Accountant Added Successfully.......")
                            }


                        }
                    });
                });
                $('#myTable').on('click', '.btn-danger', function (e) { // registering function for delete button  
                    $(this).parent().parent().remove();
                    //e.preventDefault();
                    //var rowIndex = $(this).find('td:eq(0)').text();
                    //alert(table.row(this).data());
                    //if ($("#myTable tbody").children().children().length == 0) {
                    //    $("#myTable tbody").append(emptyRow);
                    //}
                });


                $('#myTable').on('click', '.btn-cancel', function () {
                    $(this).parent().parent().remove();
                });
                $('#myTable').on('click', '.btn-edit', function () {
                    //const Name = $(this).parent().parent().find(".tdName").html();
                    //e.preventDefault();
                    var row = $(this).closest('tr');
                    var Name = row.children('td:eq(1)').text();
                    var Email = row.children('td:eq(2)').text();
                    //alert(rowIndex);

                    row.children('td:eq(1)').html("<input type='text' value='" + Name + "' class='form-control txtName' placeholder='Enter Name '/>");


                    //const Email = $(this).parent().parent().find(".tdEmail").html();

                    row.children('td:eq(2)').html("<input type='text' value='" + Email + "' class='form-control txtEmail' placeholder='Enter Email  '/>");


                    //const Password = $(this).parent().parent().find(".tdPassword").html();

                    //$(this).parent().parent().find(".tdPassword").html("<input type='text' value='" + Password + "' class='form-control txtPassword' placeholder='Enter Password'/>");
                    $(this).parent().parent().find(".tdPassword").html("<input type='text'  class='form-control txtPassword' placeholder='Enter Password'/>");
                    
                    $(this).parent().parent().find("#editAccountantID").html(rowEditButtons);


                });
                $("#myTable").on('click', '.btn-update', function () {
                    var row = $(this).closest('tr');
                    var ID = row.children('td:eq(0)').text();
                    var Email = $(this).parent().parent().find(".txtEmail").val();
                    //$(this).parent().parent().find(".tdEmail").html("" + Email + "");
                    var Name = $(this).parent().parent().find(".txtName").val();
                    //$(this).parent().parent().find(".tdName").html("" + Name + "");
                    //var ID = $(this).parent().parent().find(".txtID").val();
                    //$(this).parent().parent().find(".tdPassword").html("");
                    //$(this).parent().parent().find(".tdAction").html(rowButtons);


                    //if (car == "") { return };
                    $.ajax({
                        url: 'Datapage.aspx/UpdateAcc',
                        type: 'post',
                        data: JSON.stringify({ "Name": Name, "Email": Email, "ID": ID }),
                        contentType: 'application/json',
                        async: false,
                        success: function (data) {
                            if (data.d) {
                                alert("Accountant Updated Successfully.......")
                            }


                        }
                    });
                });

            }
            else if (hdnUser == "Accountant") {
                BillBtn.innerHTML = '<button runat="server" OnClick="FwdBill_Click" ID="FwdBill" Value="Bill Button">Bill Button</button>'
            }
            secondTable();
            itemsTable();
            function firstTable() {
                $.ajax({
                    url: 'Datapage.aspx/GetAccountants',
                    method: 'post',
                    dataType: 'json',
                    contentType: 'application/json',
                    async: false,
                    success: function (data) {
                        $('#myTable').dataTable({
                            data: JSON.parse(data.d),
                            columns: [

                                { 'data': 'ID' },
                                { 'data': 'Name' },
                                { 'data': 'Email' },
                                {
                                    'data': 'ID',
                                    'render': function (ID, type, full, meta) {
                                        debugger
                                        return '<button type="button" class="btn btn-success btn-edit" id="editAccountantID"  >Edit</button>' + '<button type="button" class="btn btn-danger" id="delAccountID" onclick=" delAcc(' + ID + ') ">Delete</button>'
                                    },
                                },
                            ]
                        });
                    }
                });
            }

            function secondTable() {
                $.ajax({
                    url: 'Datapage.aspx/GetCustomers',
                    method: 'post',
                    dataType: 'json',
                    contentType: 'application/json',
                    async: false,
                    success: function (data) {
                        $('#newTable').dataTable({
                            data: JSON.parse(data.d),
                            columns: [

                                { 'data': 'ID' },
                                { 'data': 'Name' },
                                {
                                    'data': 'ID',
                                    'render': function (data) {
                                        return '<button  id="editAccount" class="btn btn-primary" >Edit</button>'
                                    },
                                },
                            ]
                        });
                    }
                });
            }
            function itemsTable() {
                $.ajax({
                    url: 'Datapage.aspx/GetItems',
                    method: 'post',
                    dataType: 'json',
                    contentType: 'application/json',
                    async: false,
                    success: function (data) {
                        $('#itemsTable').dataTable({
                            data: JSON.parse(data.d),
                            columns: [

                                { 'data': 'ID' },
                                { 'data': 'Name' },
                                { 'data': 'CostPrice' },
                                { 'data': 'SalePrice' },
                                {
                                    'data': 'ID',
                                    'render': function (data) {
                                        return '<button  id="editAccount" class="btn btn-primary" >Edit</button>'
                                    },
                                },
                            ]
                        });
                    }
                });
            }


        });
        function editEmployee(id) {
            //var a = document.getElementById("myTable").rows[1].cells[0].innerHTML;
            var nameTag = document.createElement("input");
            nameTag.setAttribute("Type", "Text");
            nameTag.setAttribute("ID", "nameTag");

            alert(a);
        }

        function delAcc(id) {
            $.ajax({
                url: 'DataPage.aspx/DelAcc',
                type: 'post',
                data: JSON.stringify({ "ID": id }),
                contentType: 'application/json',
                async: false,
                success: function (data) {
                    if (data.d) {
                        alert("Accountant Deleted Successfully.......")
                    }


                }
            });
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div>
                <asp:HiddenField runat="server" ID="hdnUser"/>
            </div>
                <div id="AccTable">
            </div>
            <h2>Customers</h2>
            <div>
                <table id="newTable" class="table table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Customer Name</th>
                        <th>Edit</th>
                    </tr>
                </thead>
            </table>

            </div>
            <h2>Items List</h2>
            <div>
                <table id="itemsTable" class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Item ID</th>
                        <th>Items Name</th>
                        <th>Cost Price</th>
                        <th>Sale Price</th>
                        <th>Edit</th>
                        <%--<th><asp:CheckBox runat="server" /></th>--%>
                    </tr>
                </thead>
                    
            </table>
            <asp:HiddenField runat="server" ID="hdnPSwd" />
            </div>
            <div id="BillBtn">
                <%--<asp:Button runat="server" OnClick="FwdBill_Click" ID="CalBill" Text="Bill Button" Value="Bill Button" />--%>
            </div>
            
        </div>
    </form>
</body>
</html>
