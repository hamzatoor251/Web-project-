using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

namespace Web_Project_Datatable
{
    public partial class Login_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userName = Request["user"];
            User.Text = userName;
            string conString = "Data Source=CMDLHRDB01;Initial Catalog=MyDB;User ID=sa;Password=CureMD2022";

        }
        public class AdminMember
        {

            //public List<AdminMember> newStaff = new List<AdminMember>();
            public string Name { get; set; }
            public string Password { get; set; }
            public List<AdminMember> MakeEmp()
            {
                List<AdminMember> newStaff = new List<AdminMember>();
                //SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-251\SQLQuery4; Database=master;Integrated Security=True");

                //{
                //    con.Open();
                //    SqlCommand cmd = new SqlCommand(@"Select ID as EmpID,
                //                                Name as UserName,
                //                                Password as PSW 
                //                                from Admins;", con);
                //    //SqlDataAdapter sda = new SqlDataAdapter(cmd);
                //    var dataReader = cmd.ExecuteReader();
                //    newStaff = GetList<AdminMember>(dataReader);
                //}

                //DataSet ds = new DataSet();
                //sda.Fill(ds, "testTable");

                newStaff.Add(new AdminMember() { Name = "Ali", Password = "Ali111@" });
                newStaff.Add(new AdminMember() { Name = "Ahmad", Password = "Ahmad222@" });
                newStaff.Add(new AdminMember() { Name = "Ghufi", Password = "Ghufi333@" });
                newStaff.Add(new AdminMember() { Name = "Ibi", Password = "Ibi444@" });
                newStaff.Add(new AdminMember() { Name = "Haday", Password = "Haday555@" });
                newStaff.Add(new AdminMember() { Name = "Iram", Password = "Iram666@" });
                newStaff.Add(new AdminMember() { Name = "Rida", Password = "Rida777@" });

                return newStaff;
            }
            private List<T> GetList<T>(IDataReader reader)
            {
                List<T> list = new List<T>();
                while (reader.Read())
                {
                    var type = typeof(T);
                    T obj = (T)Activator.CreateInstance(type);
                    foreach (var prop in type.GetProperties())
                    {
                        var propType = prop.PropertyType;
                        prop.SetValue(obj, Convert.ChangeType(reader[prop.Name].ToString(), propType));

                    }
                    list.Add(obj);
                }
                return list;
            }
        }
        //public class AccMember
        //{

        //    //public List<AdminMember> newStaff = new List<AdminMember>();
        //    public string Name { get; set; }
        //    public string Password { get; set; }
        //    public string ID { get; set; }
        //    public List<AccMember> MakeEmp()
        //    {
        //        var newStaff = new List<AccMember>();
        //        newStaff.Add(new AccMember() { Name = "Ali", Password = "Ali111@", ID="001"});
        //        newStaff.Add(new AccMember() { Name = "Ahmad", Password = "Ahmad222@", ID="002" });
        //        newStaff.Add(new AccMember() { Name = "Ghufi", Password = "Ghufi333@", ID="003" });
        //        newStaff.Add(new AccMember() { Name = "Ibi", Password = "Ibi444@", ID="004" });
        //        newStaff.Add(new AccMember() { Name = "Haday", Password = "Haday555@", ID="005" });
        //        newStaff.Add(new AccMember() { Name = "Iram", Password = "Iram666@", ID="006" });
        //        newStaff.Add(new AccMember() { Name = "Rida", Password = "Rida777@", ID="007" });

        //        return newStaff;
        //    }
        //}

        protected void result_Click(object sender, EventArgs e)
        {
            string name = hdnname.Value;
            string password = hdnpass.Value;

            if (Session["User"].ToString() == "Admin")
            {

                //List<AdminMember> staffList = new AdminMember().MakeEmp();
                //List<AccMember> accList = new AccMember().MakeEmp();
                string conString = "Data Source=CMDLHRDB01;Initial Catalog=MyDB;User ID=sa;Password=CureMD2022";

                SqlConnection con = new SqlConnection(conString);

                string qeury = "select * From adminList where userName='" + userName.Text + "' And Password= '" + passWord.Text + "'";
                SqlCommand cmd = new SqlCommand(qeury, con);
                cmd.Parameters.Add(new SqlParameter("@userName", this.userName.Text.Trim()));
                cmd.Parameters.Add(new SqlParameter("@Password", this.passWord.Text.Trim()));

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (rdr.Read())
                {
                    string userName = Request["user"];
                    Session["Name"] = name;
                    Session["Password"] = password;
                    //Session["AccList"] = accList;
                    Response.Redirect("Datapage.aspx?user=" + name);

                    //Response.Redirect("Datapage.aspx?user=" + userName);
                }
                else
                {
                    snameError.Text = "User is not present";
                }
            }
            if (Session["User"].ToString() == "Accountant")
            {
                //List<AccMember> staffList = new AccMember().MakeEmp();
                string conString = "Data Source=CMDLHRDB01;Initial Catalog=MyDB;User ID=sa;Password=CureMD2022";
                SqlConnection con = new SqlConnection(conString);

                string qeury = "select * From accList where userName='" + userName.Text + "' And Password= '" + passWord.Text + "'";
                SqlCommand cmd = new SqlCommand(qeury, con);
                cmd.Parameters.Add(new SqlParameter("@userName", this.userName.Text.Trim()));
                cmd.Parameters.Add(new SqlParameter("@Password", this.passWord.Text.Trim()));

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (rdr.Read())
                {
                    string userName = Request["user"];
                    //spassError.Text = "LogedIn";
                    Session["Name"] = name;
                    Session["Password"] = password;
                    //Session["AccList"] = accList;
                    Response.Redirect("Datapage.aspx?user=" + name);

                    //Response.Redirect("Datapage.aspx?user=" + userName);
                }
                else
                {
                    snameError.Text = "User is not present";
                }
            }

            //string userName = Request["user"];
            //Response.Redirect("Datapage.aspx?user=" + userName);
        }

    }
}