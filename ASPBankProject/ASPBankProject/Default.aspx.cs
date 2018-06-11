using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;



namespace ASPBankProject
{
    public partial class Default : System.Web.UI.Page
    {
        private Worker worker1;
        private delegate void DelegateForWorker(object fileName);
        private DataClassString3 nameOfFile;
        private string guidID;

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition   
            {
                Path = "~/scripts/jquery-3.3.1.slim.min.js",

            });
        }


        protected void ButStart_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                nameOfFile = new DataClassString3();
                guidID = Guid.NewGuid().ToString();    //   generating of unique key

                worker1 = new Worker();
                
                worker1.ListBoxNotUniqEvent += worker_ListBoxNotUniqEvent;
                worker1.ListBoxNotValidEvent += worker_ListBoxNotValidEvent;
                worker1.ListBoxInBlackListEvent += worker_ListBoxInBlackListEvent;

                string typeOfFile1 = System.IO.Path.GetExtension(FUpFile.FileName);
                string typeOfFile2 = System.IO.Path.GetExtension(FUpBlack.FileName);
                if ((typeOfFile1 == ".xls" || typeOfFile1 == ".xlsx") && (typeOfFile2 == ".xls" || typeOfFile2 == ".xlsx"))
                {
                        DelegateForWorker startWorkerMethods = worker1.ReadTheFile; 
                        startWorkerMethods += worker1.ReadTheBlackList;
                        startWorkerMethods += worker1.ValidationTaxId;
                        startWorkerMethods += worker1.SearchNotUniqTaxId;
                        startWorkerMethods += worker1.SearchTaxIdInBlackList;
                        if (RadioButtonList1.SelectedValue == "2")
                            startWorkerMethods += worker1.WriteResultsIntoFile;

                        string path = Server.MapPath("App_Data//");   //  getting absolute path to the folder vith data 
                        FUpFile.SaveAs(path + guidID+ FUpFile.FileName);      //   upload the file to the server
                        FUpBlack.SaveAs(path + guidID + FUpBlack.FileName);

                        nameOfFile.N1 = Server.MapPath(@"App_Data\"+ guidID + FUpFile.FileName);      //   saving the absolute path for reading the file in methods of "worker"
                        nameOfFile.N2 = Server.MapPath(@"App_Data\" + guidID + FUpBlack.FileName);
                        nameOfFile.N3 = Server.MapPath(@"App_Data\Result_" + guidID + ".xlsx");

                        startWorkerMethods(nameOfFile);

                        File.Delete(nameOfFile.N1);      //   deleting used files
                        File.Delete(nameOfFile.N2);

                        if (RadioButtonList1.SelectedValue == "2")
                        {
                            Response.ContentType = "application/xlsx";
                            Response.AppendHeader("Content-Disposition", "attachment; filename=results.xlsx");
                            Response.TransmitFile(nameOfFile.N3);
                            Response.End();
                            File.Delete(nameOfFile.N3);
                        }
                }
                else
                {
                    Response.Write("Select the input file and the blacklist");
                }
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Repeater1.DataSource = null;
            Repeater1.DataSourceID = null;
            Repeater1.DataBind();
            
            Repeater2.DataSource = null;
            Repeater2.DataSourceID = null;
            Repeater2.DataBind();

            Repeater3.DataSource = null;
            Repeater3.DataSourceID = null;
            Repeater3.DataBind();
        }


  
        private void worker_ListBoxNotUniqEvent(List<DataClassString4> listForShow)
        {
            if (RadioButtonList1.SelectedValue == "1")
            {
                Repeater1.DataSource = listForShow;
                Repeater1.DataBind();
            }
        }

        private void worker_ListBoxNotValidEvent(List<DataClassString3> listForShow)
        {
            if (RadioButtonList1.SelectedValue == "1")
            {
                Repeater2.DataSource = listForShow;
                Repeater2.DataBind();
            }
        }

        private void worker_ListBoxInBlackListEvent(List<DataClassString4> listForShow)
        {
            if (RadioButtonList1.SelectedValue == "1")
            {
                Repeater3.DataSource = listForShow;
                Repeater3.DataBind();
            }
        }
        
    }
}