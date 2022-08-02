using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Globalization;
using System.Threading;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

namespace Web_Project_Datatable
{
    public partial class Datapage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"].ToString() == "Admin")
            {
                hdnUser.Value = "Admin";

            }
            else if (Session["User"].ToString() == "Accountant")
            {
                hdnUser.Value = "Accountant";

            }
        }
        public class Accountants
        {
            public string Name { get; set; }
            public string ID { get; set; }
            public string Email { get; set; }

            public string Password { get; set; }
            public List<Accountants> RetList()
            {
                var newList = new List<Accountants>();
                //newList.Add(new Accountants() { Name = "Ali", Password = "Ali111@", ID = "001" });
                //newList.Add(new Accountants() { Name = "Ahmad", Password = "Ahmad222@", ID = "002" });
                //newList.Add(new Accountants() { Name = "Ghufi", Password = "Ghufi333@", ID = "003" });
                //newList.Add(new Accountants() { Name = "Ibi", Password = "Ibi444@", ID = "004" });
                //newList.Add(new Accountants() { Name = "Haday", Password = "Haday555@", ID = "005" });
                //newList.Add(new Accountants() { Name = "Iram", Password = "Iram666@", ID = "006" });
                //newList.Add(new Accountants() { Name = "Rida", Password = "Rida777@", ID = "007" });
                //string conString = "Data Source=DESKTOP-251;Initial Catalog=Admins;Integrated Security=True";
                string conString = "Data Source=CMDLHRDB01;Initial Catalog=MyDB;User ID=sa;Password=CureMD2022";
                SqlConnection con = new SqlConnection(conString);

                string qeury = "select * From accList";
                SqlCommand cmd = new SqlCommand(qeury, con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    Accountants acc = new Accountants();
                    acc.ID = Convert.ToString(rdr["ID"]);
                    acc.Name = (rdr["userName"].ToString());
                    acc.Email = rdr["Email"].ToString();
                    acc.Password = rdr["Password"].ToString();
                    newList.Add(acc);
                }
                return newList;
            }
        }

        public class Customers
        {
            public string Name { get; set; }
            public string ID { get; set; }
            public string Email { get; set; }
            public string Adress { get; set; }

            public List<Customers> RetAcc()
            {
                List<Customers> newList = new List<Customers>();
                //newList.Add(new Customers() { Name = "Ali", ID = "01" });
                //newList.Add(new Customers() { Name = "Ahmad", ID = "02" });
                //newList.Add(new Customers() { Name = "Ghufi", ID = "03"});
                //newList.Add(new Customers() { Name = "Ibi", ID = "04"});
                //newList.Add(new Customers() { Name = "Haday", ID = "05"});
                //newList.Add(new Customers() { Name = "Iram", ID = "06" });
                //newList.Add(new Customers() { Name = "Rida", ID = "07" });
                //newList.Add(new Customers() { Name = "Tahir", ID = "08" });
                //newList.Add(new Customers() { Name = "Bilal", ID = "09" });
                //newList.Add(new Customers() { Name = "Moadib", ID = "10" });
                //newList.Add(new Customers() { Name = "Nasir", ID = "11" });
                //newList.Add(new Customers() { Name = "Osama", ID = "12" });
                //newList.Add(new Customers() { Name = "Roshan", ID = "13" });
                //newList.Add(new Customers() { Name = "Awais", ID = "14" });
                //newList.Add(new Customers() { Name = "Kazim", ID = "15" });
                //newList.Add(new Customers() { Name = "Numan", ID = "16"});
                //newList.Add(new Customers() { Name = "Raza", ID = "17"});
                //newList.Add(new Customers() { Name = "Omer", ID = "18"});
                string conString = "Data Source=CMDLHRDB01;Initial Catalog=MyDB;User ID=sa;Password=CureMD2022";
                SqlConnection con = new SqlConnection(conString);

                string qeury = "select * From customersList";
                SqlCommand cmd = new SqlCommand(qeury, con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    Customers cust = new Customers();
                    cust.ID = Convert.ToString(rdr["ID"]);
                    cust.Name = (rdr["userName"].ToString());
                    cust.Email = rdr["Email"].ToString();
                    cust.Adress = rdr["Adress"].ToString();
                    newList.Add(cust);
                }
                return newList;
            }
        }
        public class ItemsList
        {
            public string Name { get; set; }
            public string ID { get; set; }
            public int CostPrice { get; set; }
            public int SalePrice { get; set; }
            public string Expiry { get; set; }

            public List<ItemsList> MakeItema()
            {
                List<ItemsList> newList = new List<ItemsList>();
                //newList.Add(new ItemsList() { Name = "Apples", ID = "A001", CostPrice="10" , SalePrice="15"});
                //newList.Add(new ItemsList() { Name = "Pears", ID = "P002", CostPrice = "12", SalePrice="17" });
                //newList.Add(new ItemsList() { Name = "Bananas ", ID = "B003" , CostPrice = "15", SalePrice="20"});
                //newList.Add(new ItemsList() { Name = "Milk", ID = "M004", CostPrice="20", SalePrice="30" });
                //newList.Add(new ItemsList() { Name = "Butter", ID = "B005", CostPrice="42", SalePrice="50" });
                //newList.Add(new ItemsList() { Name = "Eggs", ID = "E006", CostPrice="14", SalePrice="21" });
                //newList.Add(new ItemsList() { Name = "Soap", ID = "S007", CostPrice="5", SalePrice="12" });
                //newList.Add(new ItemsList() { Name = "Shampoo", ID = "S008", CostPrice="9", SalePrice="14" });
                //newList.Add(new ItemsList() { Name = "Conditioner", ID = "C009", CostPrice="35", SalePrice="45" });
                //newList.Add(new ItemsList() { Name = "Deodorant", ID = "D010", CostPrice="24", SalePrice="34" });
                //newList.Add(new ItemsList() { Name = "Beans", ID = "B011", CostPrice="23", SalePrice="25" });
                //newList.Add(new ItemsList() { Name = "Soup", ID = "S012", CostPrice="17", SalePrice="23" });
                //newList.Add(new ItemsList() { Name = "Broth", ID = "B013", CostPrice="31", SalePrice="35" });
                //newList.Add(new ItemsList() { Name = "Meals", ID = "M014", CostPrice="25", SalePrice="35" });
                //newList.Add(new ItemsList() { Name = "Pizza", ID = "P015", CostPrice="20", SalePrice="32" });
                //newList.Add(new ItemsList() { Name = "Potatoes", ID = "P016", CostPrice="12", SalePrice="17" });
                //newList.Add(new ItemsList() { Name = "Sandwich", ID = "S017", CostPrice="18", SalePrice="22" });
                //newList.Add(new ItemsList() { Name = "Hot Cereal", ID = "H018", CostPrice="27", SalePrice="32" });
                string conString = "Data Source=CMDLHRDB01;Initial Catalog=MyDB;User ID=sa;Password=CureMD2022";
                SqlConnection con = new SqlConnection(conString);

                string qeury = "select * From itemsList";
                SqlCommand cmd = new SqlCommand(qeury, con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    ItemsList item = new ItemsList();
                    item.ID = Convert.ToString(rdr["ID"]);
                    item.Name = (rdr["Name"].ToString());
                    item.CostPrice = Convert.ToInt32(rdr["CostPrice"]);
                    item.SalePrice = Convert.ToInt32(rdr["SalePrice"]);
                    item.Expiry = rdr["Expiry"].ToString();
                    newList.Add(item);
                }
                return newList;
            }
        }
        protected void BillPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("BillPage.aspx?user=");
        }
        [WebMethod]
        public static string GetAccountants()
        {

            Accountants accList = new Accountants();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Serialize(accList.RetList());
        }
        [WebMethod]
        public static string GetCustomers()
        {
            Customers customers = new Customers();
            JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();
            return javaScriptSerializer.Serialize(customers.RetAcc());
        }
        [WebMethod]
        public static string GetItems()
        {
            ItemsList Items = new ItemsList();
            JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();
            return javaScriptSerializer.Serialize(Items.MakeItema());
        }
        [WebMethod]
        public static bool AddAcc(string Name, string Email, string Password)
        {
            string conString = "Data Source=CMDLHRDB01;Initial Catalog=MyDB;User ID=sa;Password=CureMD2022";
            SqlConnection con = new SqlConnection(conString);

            string qeury = "insert into accList (userName,Email,Password) values ('" + Name + "','" + Email + "','" + Password + "')";
            SqlCommand cmd = new SqlCommand(qeury, con);
            con.Open();
            cmd.ExecuteNonQuery();
            return true;
        }
        [WebMethod]
        public static bool UpdateAcc(string Name, string Email, string ID)
        {
            string conString = "Data Source=CMDLHRDB01;Initial Catalog=MyDB;User ID=sa;Password=CureMD2022";
            SqlConnection con = new SqlConnection(conString);

            string qeury = "insert into accList (userName,Email,Password) values ('" + Name + "','" + Email + "') where ID='"+ID+"'";
            SqlCommand cmd = new SqlCommand(qeury, con);
            con.Open();
            cmd.ExecuteNonQuery();
            return true;
        }
        [WebMethod]
        public static bool DelAcc(int ID)
        {

            string conString = "Data Source=CMDLHRDB01;Initial Catalog=MyDB;User ID=sa;Password=CureMD2022";
            SqlConnection con = new SqlConnection(conString);

            string qeury = "delete from accList where  ID='" + ID + "'";
            SqlCommand cmd = new SqlCommand(qeury, con);
            con.Open();
            cmd.ExecuteNonQuery();
            return true;
        }
        protected void FwdBill_Click(object sender, EventArgs e)
        {
            Response.Redirect("BillPage.aspx?user=");
        }
    }
}