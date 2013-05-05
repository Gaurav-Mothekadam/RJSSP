using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Raigad.UserControls;

namespace Raigad.Forms
{
    public partial class MonthlyEntries : System.Web.UI.Page
    {
        #region Global Variable Declaration
        clsMonthlyEntry objMonthlyEntry;
        DataTable dtmonthlyEntryGrid;
        clsCustomer objCustomer;
        DataTable dtCustomer;
        #endregion

        #region Methods



        public void BindMonthlyEntriesPeriods()
        {
            try
            {
                //Bind Years
                for (int iCounter = 1990; iCounter <= DateTime.Now.Year; iCounter++)
                {
                    ddlyear.Items.Add(new ListItem(iCounter.ToString(), iCounter.ToString()));
                }
                ddlyear.SelectedIndex = ddlyear.Items.IndexOf(ddlyear.Items.FindByValue(DateTime.Now.Year.ToString()));

                //Bind Months
                for (int jCounter = 1; jCounter <= 12; jCounter++)
                {
                    ddlmonth.Items.Add(new ListItem(jCounter.ToString(), jCounter.ToString()));
                }
                ddlmonth.SelectedIndex = ddlmonth.Items.IndexOf(ddlmonth.Items.FindByValue(DateTime.Now.Month.ToString()));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        /// <summary>
        /// Added By : pradip pawar
        /// Date : 25-03-2013
        /// Desc : Fill Customer Details from Search Popup
        /// </summary>
        private void BindCustomerDetails()
        {
            objCustomer = new clsCustomer();
            dtCustomer = new DataTable();
            try
            {
                if (!string.IsNullOrEmpty(hdnCustomerId.Value))
                {
                    objCustomer.CustomerId = Convert.ToInt64(hdnCustomerId.Value);
                    dtCustomer = objCustomer.GetCustomerDetailsByCustomerID();
                    if (dtCustomer.Rows.Count > 0)
                    {
                        //Fill Customer Details
                        ClearControl();
                        txtCustomerNo.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["CustomerCode"].ToString()) ? dtCustomer.Rows[0]["CustomerCode"].ToString() : string.Empty;
                        lblCustomerName.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["FULLNAME"].ToString()) ? dtCustomer.Rows[0]["FirstName"].ToString() : string.Empty;
                        lblCustomerType.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["CustomerTypeName"].ToString()) ? dtCustomer.Rows[0]["CustomerTypeName"].ToString() : string.Empty;
                        lblbShareBalance.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["ShareBalance"].ToString()) ? Convert.ToDouble(dtCustomer.Rows[0]["ShareBalance"]).ToString("N2") : string.Empty;
                        lblKayamNidhiBalance.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["KayamNidhiBalance"].ToString()) ?Convert.ToDouble( dtCustomer.Rows[0]["KayamNidhiBalance"]).ToString("N2") : string.Empty;
                        lblAccountBalance.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["AccountBalance"].ToString()) ?Convert.ToDouble(dtCustomer.Rows[0]["AccountBalance"]).ToString("N2") : string.Empty;

                    }
                }
            }
            catch (Exception ex)
            { }
            finally
            {
                objCustomer = new clsCustomer();
                dtCustomer = new DataTable();
            }
        }

        /// <summary>
        /// Added By : pradip pawar
        /// Date : 26-03-2013
        /// Desc : Bind MonthlyEntry Details to grid
        /// </summary>
        public void BindMonthlyEntryGrid()
        {
            objMonthlyEntry = new clsMonthlyEntry();
            DataTable dtMonthlyEntry = new DataTable();
            try
            {
                if (!string.IsNullOrEmpty(txtCustomerNo.Text) && !string.IsNullOrEmpty(ddlmonth.SelectedValue) && !string.IsNullOrEmpty(ddlyear.SelectedValue))
                {
                    objMonthlyEntry.CustomerId = Convert.ToInt64(hdnCustomerId.Value); ;
                    objMonthlyEntry.EntryMonth = Convert.ToInt32(ddlmonth.SelectedValue);
                    objMonthlyEntry.EntryYear = Convert.ToInt32(ddlyear.SelectedValue);
                }
                else
                {
                    objMonthlyEntry.CustomerId = 0;
                    objMonthlyEntry.EntryMonth = 0;
                    objMonthlyEntry.EntryYear = 0;
                }

                dtMonthlyEntry = objMonthlyEntry.SearcheAllmonthlyEntryWSearchFilters();
                if (dtMonthlyEntry.Rows.Count > 0)
                {
                    gvMonthlyEntry.DataSource = dtMonthlyEntry;
                }
                else
                {
                    gvMonthlyEntry.DataSource = null;
                }

                gvMonthlyEntry.PageSize = Convert.ToInt32(ddlMEPager.SelectedValue.ToString());
                gvMonthlyEntry.DataBind();
            }
            catch
            {
            }
            finally
            {
                objMonthlyEntry = null;
                dtMonthlyEntry = null;
            }
        }

        /// <summary>
        /// Added By : pradip pawar
        /// Date : 25-03-2013
        /// Desc : clear all control 
        /// </summary>
        public void ClearControl()
        {
            lblMonthlyEntryMessage.Text = string.Empty;
            txtCustomerNo.Enabled = true;
            ddlmonth.Enabled = true;
            ddlyear.Enabled = true;
            txtCustomerNo.Text = string.Empty;
            lblCustomerName.Text = string.Empty;
            lblCustomerType.Text = string.Empty;
            lblbShareBalance.Text = string.Empty;
            lblKayamNidhiBalance.Text = string.Empty;
            lblAccountBalance.Text = string.Empty;
        }

        /// <summary>
        /// Added By : pradip pawar
        /// Date : 26-03-2013
        /// Desc :   MonthlyEntry Grid Page Index Change.
        /// </summary>      
        protected void gvMonthlyEntry_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMonthlyEntry.PageIndex = e.NewPageIndex;
            BindMonthlyEntryGrid();
        }

        #endregion

        #region Events

        /// <summary>
        /// Added By : pradip pawar
        /// Date : 25-03-2013
        /// Desc : page load
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ucMECustomerSearch.OkButtonPressed += new CustomerSearch.OkButtonPressedHandler(ucCustomerSearch_OkButtonPressed);
                if (!IsPostBack)
                {
                    BindMonthlyEntriesPeriods();
                    ClearControl();
                    ddlmonth.SelectedValue = DateTime.Now.Month.ToString();
                    ddlyear.SelectedValue = DateTime.Now.Year.ToString();

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Added By : pradip pawar
        /// Date : 25-03-2013
        /// Desc : search customer link button
        /// </summary>
        protected void lnkOpenCustomerSearch_Click(object sender, EventArgs e)
        {
            try
            {
                mpeCustSearchPopUp.Show();

            }
            catch
            {
            }
        }

        /// <summary>
        /// Added By : pradip pawar
        /// Date : 25-03-2013
        /// Desc : Csearch pop up ok button pressed event 
        /// </summary>
        public void ucCustomerSearch_OkButtonPressed(object sender, EventArgs args)
        {
            try
            {
                if (ucMECustomerSearch.CustomerID > 0)
                {
                    hdnCustomerId.Value = Convert.ToString(ucMECustomerSearch.CustomerID);
                    BindCustomerDetails();
                    BindMonthlyEntryGrid();
                    mpeCustSearchPopUp.Hide();
                    txtCustomerNo.Enabled = false;
                    ddlmonth.Enabled = false;
                    ddlyear.Enabled = false;
                }
            }
            catch
            {
            }
        }

        /// <summary>
        /// Added By : pradip pawar
        /// Date : 26-03-2013
        /// Desc : save record in database 
        /// </summary>
        protected void gvMonthlyEntry_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            objMonthlyEntry = new clsMonthlyEntry();
            string iEntryType = string.Empty;
            int iMonthlyEntryTypeID;
            try
            {
                iEntryType = ((Label)gvMonthlyEntry.Rows[e.RowIndex].FindControl("lblEntryType")).Text;
                switch (iEntryType)
                {
                    case "LOAN EMI": iMonthlyEntryTypeID = 1;
                        break;
                    case "RD EMI": iMonthlyEntryTypeID = 2;
                        break;
                    default: iMonthlyEntryTypeID = 0;
                        break;
                }


                if (!string.IsNullOrEmpty(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString())))
                {
                    objMonthlyEntry.MonthlyEntryTypeID = iMonthlyEntryTypeID;
                    objMonthlyEntry.EntryAmount = !string.IsNullOrEmpty(Convert.ToDecimal(((Literal)gvMonthlyEntry.Rows[e.RowIndex].FindControl("litEntryAmount")).Text).ToString()) ? Convert.ToDecimal(((Literal)gvMonthlyEntry.Rows[e.RowIndex].FindControl("litEntryAmount")).Text) : 0;
                    objMonthlyEntry.EntryMonth = !string.IsNullOrEmpty(ddlmonth.SelectedValue) ? Convert.ToInt32(ddlmonth.SelectedValue) : 0;
                    objMonthlyEntry.EntryYear = !string.IsNullOrEmpty(ddlyear.SelectedValue) ? Convert.ToInt32(ddlyear.SelectedValue) : 0;
                    objMonthlyEntry.EntryDate = DateTime.Now;
                    objMonthlyEntry.CustomerId = !string.IsNullOrEmpty(((Label)gvMonthlyEntry.Rows[e.RowIndex].FindControl("lblCustomerId")).Text) ? Convert.ToInt64(((Label)gvMonthlyEntry.Rows[e.RowIndex].FindControl("lblCustomerId")).Text) : 0;
                    objMonthlyEntry.LoanId = !string.IsNullOrEmpty(((Label)gvMonthlyEntry.Rows[e.RowIndex].FindControl("lblLoanId")).Text) ? Convert.ToInt32(((Label)gvMonthlyEntry.Rows[e.RowIndex].FindControl("lblLoanId")).Text) : 0;
                    objMonthlyEntry.RecurrenceDepositeId = !string.IsNullOrEmpty(((Label)gvMonthlyEntry.Rows[e.RowIndex].FindControl("lblRecurrenceDepositeId")).Text) ? Convert.ToInt32(((Label)gvMonthlyEntry.Rows[e.RowIndex].FindControl("lblRecurrenceDepositeId")).Text) : 0;
                    objMonthlyEntry.CreatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                    objMonthlyEntry.CreatedDate = DateTime.Now;
                    objMonthlyEntry.UpdatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                    objMonthlyEntry.UpdatedDate = DateTime.Now;
                    objMonthlyEntry.IsActive = true;


                    if (objMonthlyEntry.Insert())
                    {
                        lblMonthlyEntryMessage.CssClass = "SuccessfulMessage";
                        lblMonthlyEntryMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavedSuccessfully");


                    }
                }
                else
                {
                    lblMonthlyEntryMessage.CssClass = "FailureMessage";
                    lblMonthlyEntryMessage.Text = (String)GetGlobalResourceObject("SharedResource", "LoginSessionExpire");
                }

                BindMonthlyEntryGrid();

            }
            catch
            {
                lblMonthlyEntryMessage.CssClass = "FailureMessage";
                lblMonthlyEntryMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavingFailure");
            }
            finally
            {
                objMonthlyEntry = null;

            }
        }

        /// <summary>
        /// Added By : pradip pawar
        /// Date : 27-03-2013
        /// Desc : new search
        /// </summary>         
        protected void btnNewMonthlyEntry_Click(object sender, EventArgs e)
        {
            try
            {
                ClearControl();
                ddlmonth.SelectedValue = DateTime.Now.Month.ToString();
                ddlyear.SelectedValue = DateTime.Now.Year.ToString();
                BindMonthlyEntryGrid();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Added By : pradip pawar
        /// Date : 27-03-2013
        /// Desc : pagging for gridview
        /// </summary>   
        protected void ddlMEPager_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindMonthlyEntryGrid();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
       

        /// <summary>
        /// Added By:pradip pawar
        /// Date :03-04-2013
        /// Desc :show Paid Entries disabled
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvMonthlyEntry_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblId = (Label)e.Row.Cells[0].FindControl("lblId");
                ImageButton Status = (ImageButton)e.Row.Cells[0].FindControl("ibtnEditMonthlyEntry");

                if (lblId.Text.Equals(""))
                {
                    lblId.Text = "0";
                }


                if (Convert.ToInt32(lblId.Text) > 0)
                {
                    Status.Enabled = false;
                    Status.OnClientClick = "";
                    Status.ImageUrl = "~/images/tick.gif";
                }
                else
                {

                }

            }
        } 
        
        #endregion
    }
}