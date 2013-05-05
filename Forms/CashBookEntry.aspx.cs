using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Raigad.Forms
{
    public partial class CashBookEntry : System.Web.UI.Page
    {
        #region Gloabal Declaration
        clsCashBookEntry ObjCashBook;
        CommonFunctions clsComFun;
        #endregion

        #region Methods

        /// <summary>
        /// 
        /// </summary>
        public void BindCashBookGrid()
        {
            ObjCashBook = new clsCashBookEntry();
            DataTable dtCashBook = new DataTable();
            try
            {
                if (!string.IsNullOrEmpty(txtSearchEXP.Text) && !string.IsNullOrEmpty(ddlEXPSearch.SelectedValue))
                {
                    string strsearch = ddlEXPSearch.SelectedValue.ToString();
                    switch (strsearch)
                    {
                        case "VoucherNumber":
                            ObjCashBook.VoucherNumber = Convert.ToInt32(txtSearchEXP.Text);
                            dtCashBook = ObjCashBook.GetCashBookDetailsByVoucherNumber();
                            break;
                    }
                }
                else
                {
                    dtCashBook = ObjCashBook.SearchAllCashBook();
                }

                if (dtCashBook.Rows.Count > 0)
                {
                    gvCashBook.DataSource = dtCashBook;
                }
                else
                {
                    gvCashBook.DataSource = null;
                }

                gvCashBook.PageSize = Convert.ToInt32(ddlEXPPager.SelectedValue.ToString());
                gvCashBook.DataBind();
            }
            catch
            {
            }
            finally
            {
                ObjCashBook = null;
                dtCashBook = null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public void ClearCashbookEnriesControls()
        {
            txtSearchEXP.Text = string.Empty;
            ddlEXPSearch.SelectedIndex = 0;
            ddlExpanditureType.SelectedIndex = 0;
            txtAmount.Text = string.Empty;
            txtAuthorizedby.Text = string.Empty;
            txtDate.Text = DateTime.Now.ToString("yyyy/MM/dd"); ;
            txtBank.Text = string.Empty;
            txtChequeno.Text = string.Empty;
            txtBank.Text = string.Empty;
            txtDescription.Text = string.Empty;

        }

        /// <summary>
        /// 
        /// </summary>
        public void BindExpanditureType()
        {
            try
            {
                CommonFunctions.ExpanditureType(ddlExpanditureType);
            }
            catch { }
        }

        /// <summary>
        /// 
        /// </summary>
        private void SetVoucherNo()
        {
            try
            {
                CommonFunctions.SetVoucherNo(txtVoucherNo);
            }
            catch { }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="IsShow"></param>
        private void ShowHideCashBookGrid(bool IsShow)
        {
            if (IsShow) { divEXPGrid.Style.Add("display", "block"); divNewEXPPopup.Style.Add("display", "none"); }
            else { divEXPGrid.Style.Add("display", "none"); divNewEXPPopup.Style.Add("display", "block"); }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="IsEnable"></param>
        private void EnableDisableCashBookEnriesControls(bool IsEnable)
        {
            try
            {
               // txtAmount.Enabled = IsEnable;
               // txtAuthorizedby.Enabled = IsEnable;
              //  txtBank.Enabled = IsEnable;
              //  txtChequeno.Enabled = IsEnable;
             //   txtDate.Enabled = IsEnable;
             //   txtDescription.Enabled = IsEnable;
            //    txtSearchEXP.Enabled = IsEnable;
                txtVoucherNo.Enabled = IsEnable;
             //   ddlExpanditureType.Enabled = IsEnable;
                btnSave.Visible = IsEnable;

                if (IsEnable)
                {
                    btnSave.Visible = true;
                    btnUpdate.Visible = false;
                }
                else
                {
                    btnSave.Visible = false;
                    btnUpdate.Visible = true;
                }
            }
            catch
            { }
        }

        #endregion

        #region Events

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    ClearCashbookEnriesControls();
                    SetVoucherNo();
                    ShowHideCashBookGrid(true);
                    BindExpanditureType();
                    BindCashBookGrid();
                }
                lblCashbookMessage.Text = string.Empty;
            }
            catch (Exception ex)
            {
            }
        }

        /// <summary>
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNewCashBook_Click(object sender, EventArgs e)
        {
            try
            {
                ClearCashbookEnriesControls();
                ShowHideCashBookGrid(false);
                SetVoucherNo();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "PopupScript", "<script>HideShowBankDetails('0');</script>", false);   
            }
            catch
            {
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlExpanditureType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindExpanditureType();
            }
            catch
            { }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            ObjCashBook = new clsCashBookEntry();

            try
            {
                if (!string.IsNullOrEmpty(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString())))
                {
                    ObjCashBook.ExpenditureId = !string.IsNullOrEmpty(txtVoucherNo.Text) ? Convert.ToInt32(txtVoucherNo.Text.ToString()) : 0;
                    ObjCashBook.ExpenditureDate = !string.IsNullOrEmpty(txtDate.Text) ? txtDate.Text.ToString() : string.Empty;
                    ObjCashBook.ExpenditureAmount = !string.IsNullOrEmpty(txtAmount.Text) ? Convert.ToDecimal(txtAmount.Text.ToString()) : 0;
                    ObjCashBook.ExpanditureDescription = !string.IsNullOrEmpty(txtDescription.Text) ? txtDescription.Text.ToString() : string.Empty;
                    ObjCashBook.ExpenditureTypeId = !string.IsNullOrEmpty(ddlExpanditureType.SelectedValue) ? Convert.ToInt32(ddlExpanditureType.SelectedValue.ToString()) : 0;
                    ObjCashBook.IsPaidByCash = (chkCash.Checked) ? true : false;
                    ObjCashBook.IsPaidByCheque = (chkCheque.Checked) ? true : false;
                    ObjCashBook.ChequeNumber = !string.IsNullOrEmpty(txtChequeno.Text) ? Convert.ToInt32(txtChequeno.Text.ToString()) : 0;
                    ObjCashBook.BankName = !string.IsNullOrEmpty(txtBank.Text) ? txtBank.Text.ToString() : string.Empty;
                    ObjCashBook.ApprovedBy = !string.IsNullOrEmpty(txtAuthorizedby.Text) ? txtAuthorizedby.Text.ToString() : string.Empty;
                    ObjCashBook.CreatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                    ObjCashBook.CreatedDate = Convert.ToDateTime(txtDate.Text);
                    ObjCashBook.UpdatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                    ObjCashBook.UpdatedDate = Convert.ToDateTime(txtDate.Text);
                    ObjCashBook.IsActive = true;

                    if (ObjCashBook.Insert())
                    {
                        lblCashbookMessage.CssClass = "SuccessfulMessage";
                        lblCashbookMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavedSuccessfully");
                    }
                }
                else
                {
                    lblCashbookMessage.CssClass = "FailureMessage";
                    lblCashbookMessage.Text = (String)GetGlobalResourceObject("SharedResource", "LoginSessionExpire");
                }
                ClearCashbookEnriesControls();
                BindCashBookGrid();
                ShowHideCashBookGrid(true);
            }
            catch
            {
                lblCashbookMessage.CssClass = "FailureMessage";
                lblCashbookMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavingFailure");
            }
            finally
            {
                ObjCashBook = null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearchEXP_Click(object sender, EventArgs e)
        {
            try
            {
                ShowHideCashBookGrid(true);
                BindCashBookGrid();
            }
            catch
            {
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnClearEXP_Click(object sender, EventArgs e)
        {
            try
            {
                ClearCashbookEnriesControls();
                ShowHideCashBookGrid(true);
                BindCashBookGrid();
            }
            catch
            {
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlEXPPager_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ClearCashbookEnriesControls();
                ShowHideCashBookGrid(true);
                BindCashBookGrid();
            }
            catch
            {
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            try
            {
                ClearCashbookEnriesControls();
                BindCashBookGrid();
                EnableDisableCashBookEnriesControls(true);
                ShowHideCashBookGrid(true);
            }
            catch { }
        }

        /// <summary>
        /// Added By: pradip pawar
        /// Date :02-04-2013
        /// Description:Update Expendure
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            ObjCashBook = new clsCashBookEntry();

            try
            {
                if (!string.IsNullOrEmpty(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString())))
                {
                    ObjCashBook.ExpenditureId = !string.IsNullOrEmpty(txtVoucherNo.Text) ? Convert.ToInt32(txtVoucherNo.Text.ToString()) : 0;
                    ObjCashBook.ExpenditureDate = !string.IsNullOrEmpty(txtDate.Text) ? txtDate.Text.ToString() : string.Empty;
                    ObjCashBook.ExpenditureAmount = !string.IsNullOrEmpty(txtAmount.Text) ? Convert.ToDecimal(txtAmount.Text.ToString()) : 0;
                    ObjCashBook.ExpanditureDescription = !string.IsNullOrEmpty(txtDescription.Text) ? txtDescription.Text.ToString() : string.Empty;
                    ObjCashBook.ExpenditureTypeId = !string.IsNullOrEmpty(ddlExpanditureType.SelectedValue) ? Convert.ToInt32(ddlExpanditureType.SelectedValue.ToString()) : 0;
                    ObjCashBook.IsPaidByCash = (chkCash.Checked) ? true : false;
                    ObjCashBook.IsPaidByCheque = (chkCheque.Checked) ? true : false;
                    ObjCashBook.ChequeNumber = !string.IsNullOrEmpty(txtChequeno.Text) ? Convert.ToInt32(txtChequeno.Text.ToString()) : 0;
                    ObjCashBook.BankName = !string.IsNullOrEmpty(txtBank.Text) ? txtBank.Text.ToString() : string.Empty;
                    ObjCashBook.ApprovedBy = !string.IsNullOrEmpty(txtAuthorizedby.Text) ? txtAuthorizedby.Text.ToString() : string.Empty;
                    ObjCashBook.CreatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                    ObjCashBook.CreatedDate = Convert.ToDateTime(txtDate.Text);
                    ObjCashBook.UpdatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                    ObjCashBook.UpdatedDate = Convert.ToDateTime(txtDate.Text);
                    ObjCashBook.IsActive = true;

                    if (ObjCashBook.Update())
                    {
                        lblCashbookMessage.CssClass = "SuccessfulMessage";
                        lblCashbookMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavedSuccessfully");
                    }
                }
                else
                {
                    lblCashbookMessage.CssClass = "FailureMessage";
                    lblCashbookMessage.Text = (String)GetGlobalResourceObject("SharedResource", "LoginSessionExpire");
                }
                ClearCashbookEnriesControls();
                BindCashBookGrid();
                EnableDisableCashBookEnriesControls(true);
                ShowHideCashBookGrid(true);
            }
            catch
            {
                lblCashbookMessage.CssClass = "FailureMessage";
                lblCashbookMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavingFailure");
            }
            finally
            {
                ObjCashBook = null;
            }

         
           
            

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvCashBook_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCashBook.PageIndex = e.NewPageIndex;
            BindCashBookGrid();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvCashBook_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ObjCashBook = new clsCashBookEntry();
            DataTable dtCashBook = new DataTable();
            int iVoucherNumber;
            try
            {
                iVoucherNumber = Convert.ToInt32(((Label)gvCashBook.Rows[e.NewEditIndex].FindControl("lblExpenditureId")).Text);
                if (iVoucherNumber > 0)
                {
                    ObjCashBook.VoucherNumber = iVoucherNumber;
                    dtCashBook = ObjCashBook.GetCashBookDetailsByVoucherNumber();
                    if (dtCashBook.Rows.Count > 0)
                    {
                        //Fill Cash Bokk Information
                        txtVoucherNo.Text = dtCashBook.Rows[0]["ExpenditureId"].ToString();
                        txtDate.Text = dtCashBook.Rows[0]["ExpenditureDate"].ToString();
                        ddlExpanditureType.SelectedIndex = ddlExpanditureType.Items.IndexOf(ddlExpanditureType.Items.FindByValue(dtCashBook.Rows[0]["ExpenditureTypeId"].ToString()));
                        txtAmount.Text = CommonFunctions.FormatMoneyString(Convert.ToDecimal(dtCashBook.Rows[0]["ExpenditureAmount"].ToString()));

                        //string popupScript = string.Concat("<script language='javascript' type='text/javascript'>", "alert('Hello World');</script>");
                        
                        if (Convert.ToBoolean(dtCashBook.Rows[0]["IsPaidByCash"].ToString()))
                        {
                            chkCash.Checked = Convert.ToBoolean(dtCashBook.Rows[0]["IsPaidByCash"].ToString());
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "PopupScript", "<script>HideShowBankDetails('0');</script>", false);   
                        }
                        else if (Convert.ToBoolean(dtCashBook.Rows[0]["IsPaidByCheque"].ToString()))
                        {
                            chkCheque.Checked = Convert.ToBoolean(dtCashBook.Rows[0]["IsPaidByCheque"].ToString());
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "PopupScript", "<script>HideShowBankDetails('1');</script>", false);   
                        }
                        txtBank.Text = dtCashBook.Rows[0]["BankName"].ToString();
                        txtChequeno.Text = dtCashBook.Rows[0]["ChequeNumber"].ToString();
                        txtDescription.Text = dtCashBook.Rows[0]["ExpanditureDescription"].ToString();
                        txtAuthorizedby.Text = dtCashBook.Rows[0]["ApprovedBy"].ToString();
                        EnableDisableCashBookEnriesControls(false);
                    }
                    ShowHideCashBookGrid(false);
                    
                }
            }
            catch
            {
            }
            finally
            {
                ObjCashBook = null;
                dtCashBook = null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvCashBook_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ObjCashBook = new clsCashBookEntry();
            DataTable dtCashBook = new DataTable();
            int iVoucherNumber;
            try
            {
                iVoucherNumber = Convert.ToInt32(((Label)gvCashBook.Rows[e.RowIndex].FindControl("lblVoucherNumber")).Text);
                if (iVoucherNumber > 0)
                {
                    ObjCashBook.VoucherNumber = iVoucherNumber;
                    dtCashBook = ObjCashBook.GetCashBookDetailsByVoucherNumber();
                    if (dtCashBook.Rows.Count > 0)
                    {
                        ObjCashBook.ExpenditureId = !string.IsNullOrEmpty(dtCashBook.Rows[0]["ExpenditureId"].ToString()) ? Convert.ToInt32(dtCashBook.Rows[0]["ExpenditureId"].ToString()) : 0;
                        ObjCashBook.ExpenditureDate = !string.IsNullOrEmpty(dtCashBook.Rows[0]["ExpenditureDate"].ToString()) ? dtCashBook.Rows[0]["ExpenditureDate"].ToString() : string.Empty;
                        ObjCashBook.ExpenditureAmount = !string.IsNullOrEmpty(dtCashBook.Rows[0]["ExpenditureAmount"].ToString()) ? Convert.ToDecimal(dtCashBook.Rows[0]["ExpenditureAmount"].ToString()) : 0;
                        ObjCashBook.ExpanditureDescription = !string.IsNullOrEmpty(dtCashBook.Rows[0]["ExpanditureDescription"].ToString()) ? dtCashBook.Rows[0]["ExpanditureDescription"].ToString() : string.Empty;
                        ObjCashBook.ExpenditureTypeId = !string.IsNullOrEmpty(dtCashBook.Rows[0]["ExpenditureTypeId"].ToString()) ? Convert.ToInt32(dtCashBook.Rows[0]["ExpenditureTypeId"].ToString()) : 0;
                        ObjCashBook.IsPaidByCash = (dtCashBook.Rows[0]["IsPaidByCash"].ToString().Equals("True")) ? true : false;
                        ObjCashBook.IsPaidByCheque = (dtCashBook.Rows[0]["IsPaidByCheque"].ToString().Equals("True")) ? true : false;
                        ObjCashBook.ChequeNumber = !string.IsNullOrEmpty(dtCashBook.Rows[0]["ChequeNumber"].ToString()) ? Convert.ToInt32(dtCashBook.Rows[0]["ChequeNumber"].ToString()) : 0;
                        ObjCashBook.BankName = !string.IsNullOrEmpty(dtCashBook.Rows[0]["BankName"].ToString()) ? dtCashBook.Rows[0]["BankName"].ToString() : string.Empty;
                        ObjCashBook.ApprovedBy = !string.IsNullOrEmpty(dtCashBook.Rows[0]["ApprovedBy"].ToString()) ? dtCashBook.Rows[0]["ApprovedBy"].ToString() : string.Empty;
                        ObjCashBook.CreatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                        ObjCashBook.CreatedDate = Convert.ToDateTime(txtDate.Text);
                        ObjCashBook.UpdatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                        ObjCashBook.UpdatedDate = Convert.ToDateTime(txtDate.Text);
                        ObjCashBook.IsActive = false;
                    }
                    if (ObjCashBook.Update())
                    {
                        lblCashbookMessage.CssClass = "SuccessfulMessage";
                        lblCashbookMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavedSuccessfully");
                    }
                }
                else
                {
                    lblCashbookMessage.CssClass = "FailureMessage";
                    lblCashbookMessage.Text = (String)GetGlobalResourceObject("SharedResource", "LoginSessionExpire");
                }
                ClearCashbookEnriesControls();
                BindCashBookGrid();
                ShowHideCashBookGrid(true);
            }
            catch
            {
                lblCashbookMessage.CssClass = "FailureMessage";
                lblCashbookMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavingFailure");
            }
            finally
            {
                ObjCashBook = null;
            }
        }
              
        /// <summary>
        /// Added by:pradip
        /// date:30-03-13
        /// Description:Dynamically adding column value for Cheque and Cash
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvCashBook_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label Cheque = (Label)e.Row.Cells[0].FindControl("lblIsPaidByCheque");
                Label Status = (Label)e.Row.Cells[0].FindControl("lblPaymentStatus");
                if (Cheque.Text.Equals("True"))
                {
                    Status.Text = "psd";
                }
                else
                {
                    Status.Text = "jks[k";
                }
                
            }
        }
  #endregion
    }
}