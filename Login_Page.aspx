<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_Page.aspx.cs" Inherits="Web_Project_Datatable.Login_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"/>
    <script>
        function formValid() {
            let nameE = document.getElementById("nameError");
            nameE.innerHTML = "";
            let passwordE = document.getElementById("passError");
            passwordE.innerHTML = "";
            if (!nameValid() && !passValid()) {
                let error1 = document.getElementById("nameError");
                error1.innerHTML = "You have entered Wrong Username";
                document.forms.form1.userName.focus();
                let error2 = document.getElementById("passError");
                error2.innerHTML = "You have entered Wrong Password";
                return false;

            }
            if (!nameValid()) {
                let error1 = document.getElementById("nameError");
                document.forms.form1.userName.focus();
                error1.innerHTML = "You have entered Wrong Username";
                return false;
            }
            if (!passValid()) {
                let error2 = document.getElementById("passError");
                document.forms.form1.passWord.focus();
                error2.innerHTML = "You have entered Wrong Password";
                return false;
            }
            else {
                document.forms.form1.hdnname.value = document.forms.form1.userName.value;
                document.forms.form1.hdnpass.value = document.forms.form1.passWord.value;
                document.forms.form1.userName.value = "";
                document.forms.form1.passWord.value = "";
                return true;
            }
            function nameValid() {
                let userName = document.forms.form1.userName.value;
                let name = /^[a-zA-Z0-9\_-]+$/;
                try {
                    if (!name.test(userName)) {
                        throw ("You Entered wrong wrong username");
                    }
                }
                catch (error) {
                    let user = document.getElementById("nameError");
                    document.forms.form1.userName.focus();
                    user.innerHTML = error;
                    return false;
                }
                return true;
            }
            function passValid() {
                let passWord = document.forms.form1.passWord.value;
                let pass = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;
                try {
                    if (!pass.test(passWord)) {
                        throw ("You Entered wrong wrong passWord");
                    }
                }
                catch (error) {
                    let passErro = document.getElementById("passError");
                    passErro.innerHTML = error;
                    return false;
                }
                return true;
            }

        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="p-3 mb-2 bg-dark text-white d-flex justify-content-center text-center" style="margin:2vw; height:35vw">
                <div class="row">
                    <div class=" ">
                        <div class="col-12 " style="margin:2vw 0 ">
                           <h1>Log In as   <span class="badge badge-success"><asp:Label runat="server" id="User"></asp:Label></span></h1>
                        </div>
                        <div class="col-12" style="margin:5vw 0">
                            <label >User Name: <asp:TextBox runat="server" ID="userName" style="width:20vw"></asp:TextBox></label>
                            <div><span id="nameError" class="alert-danger" style="font-size:1vw"><asp:Label ID="snameError" runat="server" ></asp:Label></span></div>
                            <asp:HiddenField ID="hdnname" runat="server"/>
                            <label>Password: <asp:TextBox runat="server" ID="passWord" style="width:19vw"></asp:TextBox></label>
                            <div><span id="passError" class="alert-danger" style="font-size:1vw"><asp:Label ID="spassError" runat="server" ></asp:Label></span></div>
                            <asp:HiddenField ID="hdnpass" runat="server"/>
                        </div>
                        <div class="col-12" style="align-items:center; margin:2vw 0">
                            <asp:Button runat="server"    OnClick="result_Click" class="btn btn btn-primary" type="text" ID="result" Text="Log In" style="padding:2% 5%; margin:2%"></asp:Button>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </form>
</body>
</html>