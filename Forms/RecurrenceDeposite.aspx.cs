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
    public partial class RecurrenceDeposite : System.Web.UI.Page
    {
        #region Global Variable Declaration
        clsRecurrenceDeposite objRecurrenceDeposite;
        DataTable dtRecurrenceDeposite;
        clsCustomer objCustomer;
        DataTable dtCustomer;
        clsNominees objNominee;
        #endregion

        #region Methods
        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 31-12-2012
        /// Desc : Bind Recurrence Deposite Details
        /// </summary>
        public void BindRecurrenceDepositesGrid()
        {
            objRecurrenceDeposite = new clsRecurrenceDeposite();
            dtRecurrenceDeposite = new DataTable();
            try
            {
                if (!string.IsNullOrEmpty(txtSearchRD.Text) && !string.IsNullOrEmpty(ddlRDSearch.SelectedValue))
                {
                    string strsearch = ddlRDSearch.SelectedValue.ToString();
                    switch (strsearch)
                    {
                        case "CusotmerName":
                            objRecurrenceDeposite.CustomerFirstName = txtSearchRD.Text.ToString();
                            break;
                    }
                }
                else
                {
                    objRecurrenceDeposite.CustomerFirstName = string.Empty;
                }

                dtRecurrenceDeposite = objRecurrenceDeposite.SearcheAllRecurrenceDepositeWSearchFilters();
                if (dtRecurrenceDeposite.Rows.Count > 0)
                {
                    gvRecurrenceDeposite.DataSource = dtRecurrenceDeposite;
                }
                else
                {
                    gvRecurrenceDeposite.DataSource = null;
                }

                gvRecurrenceDeposite.PageSize = Convert.ToInt32(ddlRDPager.SelectedValue.ToString());
                gvRecurrenceDeposite.DataBind();
            }
            catch
            {
            }
            finally
            {
                objRecurrenceDeposite = null;
                dtRecurrenceDeposite = null;
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 31-12-2012
        /// Desc : Show Hide Recurrence Deposite Grid
        /// </summary>
        /// <param name="IsShow"></param>
        public void ShowHideRecurrenceDepositeGrid(bool IsShow)
        {
            if (IsShow) { divRDGrid.Style.Add("display", "block"); divNewRDPopup.Style.Add("display", "none"); }
            else { divRDGrid.Style.Add("display", "none"); divNewRDPopup.Style.Add("display", "block"); }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Clear All Recurrence Deposite Controls
        /// </summary>
        public void ClearRDControls()
        {
            try
            {
                hdnCustomerId.Value = string.Empty;
                hdnRecurrenceDepositeId.Value = string.Empty;
                hdnNomineeId.Value = string.Empty;
                txtSearchRD.Text = string.Empty;
                ddlRDSearch.SelectedIndex = 0;

                //Clear Recurrence Deposite Controls
                txtRDCustomerNo.Text = string.Empty;
                txtRecurrenceDepositeDate.Text = DateTime.Now.ToString("yyyy/MM/dd");
                ddlRDCustomernamePrefix.SelectedIndex = 0;
                txtRDCusotmerFirstname.Text = string.Empty;
                txtRDCustomerMiddlename.Text = string.Empty;
                txtRDCustomerLastname.Text = string.Empty;
                txtRecurrenceDepositeAmount.Text = string.Empty;
                ddlRecurrenceDepositePeriodYears.Items.Clear();
                txtRDMaturityDate.Text = string.Empty;
                txtRDMaturityAmt.Text = string.Empty;

                //Clear Recurrence Deposite Nominee Controls
                ddlRDNomineePrefix.SelectedIndex = 0;
                txtRDNomineeFirstname.Text = string.Empty;
                txtRDNomineeMiddlename.Text = string.Empty;
                txtRDNomineeLastname.Text = string.Empty;
                txtRDNomineeAddress.Text = string.Empty;
                ddlRDNomineeVillage.SelectedIndex = 0;
                ddlRDNomineeTaluka.SelectedIndex = 0;
                ddlRDNomineeDistrict.SelectedIndex = 0;
                txtRDNomineePinCode.Text = string.Empty;
                txtRDNomineePhonenumber.Text = string.Empty;
            }
            catch
            {
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 31-12-2012
        /// Desc : Fill Customer Details from Cearch Search Popup
        /// </summary>
        public void BindCustomerDetails()
        {
            try
            {
                if (!string.IsNullOrEmpty(hdnCustomerId.Value))
                {
                    objCustomer = new clsCustomer();
                    dtCustomer = new DataTable();
                    objCustomer.CustomerId = Convert.ToInt64(hdnCustomerId.Value);
                    dtCustomer = objCustomer.SearcheAllCustomerWSearchFilters();
                    if (dtCustomer.Rows.Count > 0)
                    {
                        //Fill Customer Details
                        txtRDCustomerNo.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["CustomerCode"].ToString()) ? dtCustomer.Rows[0]["CustomerCode"].ToString() : string.Empty;
                        ddlCustomerType.SelectedIndex = ddlCustomerType.Items.IndexOf(ddlCustomerType.Items.FindByText(dtCustomer.Rows[0]["CustomerTypeName"].ToString()));
                        ddlRDCustomernamePrefix.SelectedIndex = ddlRDCustomernamePrefix.Items.IndexOf(ddlRDCustomernamePrefix.Items.FindByText(dtCustomer.Rows[0]["NamePrifix"].ToString()));
                        txtRDCusotmerFirstname.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["FirstName"].ToString()) ? dtCustomer.Rows[0]["FirstName"].ToString() : string.Empty;
                        txtRDCustomerMiddlename.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["MiddleName"].ToString()) ? dtCustomer.Rows[0]["MiddleName"].ToString() : string.Empty;
                        txtRDCustomerLastname.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["LastName"].ToString()) ? dtCustomer.Rows[0]["LastName"].ToString() : string.Empty;
                    }
                }
            }
            catch
            { }
            finally
            {
                objCustomer = new clsCustomer();
                dtCustomer = new DataTable();
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 31-12-2012
        /// Desc : Bind Nominee Villages
        /// </summary>
        public void BindNomineeVillage()
        {
            try
            {
                CommonFunctions.BindVillages(ddlRDNomineeVillage);
            }
            catch { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 31-12-2012
        /// Desc : Bind Nominee Tahsils
        /// </summary>
        public void BindNomineeTahsil()
        {
            try
            {
                CommonFunctions.BindTahsils(ddlRDNomineeTaluka);
            }
            catch { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 31-12-2012
        /// Desc : Bind Nominee Districts
        /// </summary>
        public void BindNomineeDistrict()
        {
            try
            {
                CommonFunctions.BindDistricts(ddlRDNomineeDistrict);
            }
            catch { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 04-03-2013
        /// Desc :
        /// </summary>
        public void BindCustomerTypes()
        {
            try
            {
                CommonFunctions.BindCustomerTypes(ddlCustomerType);
            }
            catch { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Bind Recurrence Deposite Types
        /// </summary>
        public void BindRecurrenceDepositeTypes()
        {
            try
            {
                CommonFunctions.BindRecurrenceDepositeTypes(ddlRecurrenceDepositeType, "General");
            }
            catch
            {
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 04-03-2013
        /// Desc : Bind Recurrence Deposite Periods.
        /// </summary>
        /// <param name="RecurrenceDepositeTypeId"></param>
        public void BindRecurrenceDepositePeriods()
        {
            objRecurrenceDeposite = new clsRecurrenceDeposite();
            List<clsRecurrenceDepositeTypes> lstRDTypes = null;
            try
            {
                if (!string.IsNullOrEmpty(ddlRecurrenceDepositeType.SelectedValue.ToString()))
                {
                    ddlRecurrenceDepositePeriodYears.Items.Clear();
                    lstRDTypes = clsRecurrenceDepositeTypes.GetRecurrenceDepositePeriodsByRecurrenceDepositeTypeId(Convert.ToInt32(ddlRecurrenceDepositeType.SelectedValue.ToString()));
                    if (lstRDTypes.Count > 0)
                    {
                        ddlRecurrenceDepositePeriodYears.DataSource = lstRDTypes;
                        ddlRecurrenceDepositePeriodYears.DataValueField = "RecurrenceDepositeTypeId";
                        ddlRecurrenceDepositePeriodYears.DataTextField = "RecurrenceDepositeTypeName";
                        ddlRecurrenceDepositePeriodYears.DataBind();
                    }
                    ddlRecurrenceDepositePeriodYears.Items.Insert(0, new ListItem("fuoMk", ""));
                }
            }
            catch
            {
            }
            finally
            {
                objRecurrenceDeposite = null;
                lstRDTypes = null;
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 04-03-2013
        /// </summary>
        public void BindRecurrenceDepositeMaturityDetails()
        {
            objRecurrenceDeposite = new clsRecurrenceDeposite();
            DataTable dtRecurrenceDeposite = new DataTable();
            try
            {
                if (!string.IsNullOrEmpty(ddlRecurrenceDepositePeriodYears.SelectedValue.ToString()))
                {
                    objRecurrenceDeposite.RecurrenceDepositeTypeId = Convert.ToInt32(ddlRecurrenceDepositePeriodYears.SelectedValue);
                    objRecurrenceDeposite.RecurrenceDepositeAmount = !string.IsNullOrEmpty(txtRecurrenceDepositeAmount.Text) ? Convert.ToDecimal(txtRecurrenceDepositeAmount.Text) : 0;
                    objRecurrenceDeposite.RecurrenceDepositeDate = !string.IsNullOrEmpty(txtRecurrenceDepositeDate.Text) ? txtRecurrenceDepositeDate.Text : string.Empty;
                    dtRecurrenceDeposite = objRecurrenceDeposite.GetRecurrenceDepositeMaturityDetailsByRecurrenceDepositeTypeId();
                    if (dtRecurrenceDeposite.Rows.Count > 0)
                    {
                        txtRDInterestRate.Text = dtRecurrenceDeposite.Rows[0]["RecurrenceDepositeDate"].ToString();
                        txtRDMaturityDate.Text = dtRecurrenceDeposite.Rows[0]["MaturityDate"].ToString();
                        txtRDMaturityAmt.Text = CommonFunctions.FormatMoneyString(Convert.ToDecimal(dtRecurrenceDeposite.Rows[0]["MaturityAmount"]));
                    }
                }
            }
            catch
            { }
            finally
            {
                objRecurrenceDeposite = null;
                dtRecurrenceDeposite = null;
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 08-01-2013
        /// Desc :
        /// </summary>
        /// <param name="IsEnable"></param>
        public void EnableDisableRecurrenceDepositeControls(bool IsEnable)
        {
            try
            {
                txtRecurrenceDepositeDate.Enabled = IsEnable;
                ibtnRecurrenceDepositeDate.Enabled = IsEnable;
                txtRDCustomerNo.Enabled = IsEnable;
                ddlCustomerType.Enabled = IsEnable;
                ddlRDCustomernamePrefix.Enabled = IsEnable;
                txtRDCusotmerFirstname.Enabled = IsEnable;
                txtRDCustomerMiddlename.Enabled = IsEnable;
                txtRDCustomerLastname.Enabled = IsEnable;
                ddlRecurrenceDepositeType.Enabled = IsEnable;
                txtRecurrenceDepositeAmount.Enabled = IsEnable;
                ddlRecurrenceDepositePeriodYears.Enabled = IsEnable;
                txtRDInterestRate.Enabled = IsEnable;
                txtRDMaturityDate.Enabled = IsEnable;
                ibtnRDMaturityDate.Enabled = IsEnable;
                txtRDMaturityAmt.Enabled = IsEnable;

                //Clear Recurrence Deposite Nominee Controls
                ddlRDNomineePrefix.Enabled = IsEnable;
                txtRDNomineeFirstname.Enabled = IsEnable;
                txtRDNomineeMiddlename.Enabled = IsEnable;
                txtRDNomineeLastname.Enabled = IsEnable;
                txtRDNomineeAddress.Enabled = IsEnable;
                ddlRDNomineeVillage.Enabled = IsEnable;
                ddlRDNomineeTaluka.Enabled = IsEnable;
                ddlRDNomineeDistrict.Enabled = IsEnable;
                txtRDNomineePinCode.Enabled = IsEnable;
                txtRDNomineePhonenumber.Enabled = IsEnable;

                lnkOpenCustomerSearch.Enabled = IsEnable;
                btnSaveRecurrenceDepoisite.Visible = IsEnable;

                if (IsEnable)
                {
                    btnSaveRecurrenceDepoisite.Visible = true;
                    btnCloseRecurrenceDeposite.Visible = false;
                }
                else
                {
                    btnSaveRecurrenceDepoisite.Visible = false;
                    btnCloseRecurrenceDeposite.Visible = true;
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
                ucRDCustomerSearch.OkButtonPressed += new CustomerSearch.OkButtonPressedHandler(ucCustomerSearch_OkButtonPressed);
                if (!IsPostBack)
                {
                    ClearRDControls();
                    ShowHideRecurrenceDepositeGrid(true);
                    BindCustomerTypes();
                    BindRecurrenceDepositeTypes();
                    BindNomineeVillage();
                    BindNomineeTahsil();
                    BindNomineeDistrict();
                    BindRecurrenceDepositesGrid();
                }
                lblRecurrenceDepositeMessage.Text = string.Empty;
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
        protected void btnSearchRD_Click(object sender, EventArgs e)
        {
            try
            {
                ShowHideRecurrenceDepositeGrid(true);
                BindRecurrenceDepositesGrid();
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
        protected void btnClearRD_Click(object sender, EventArgs e)
        {
            try
            {
                ClearRDControls();
                ShowHideRecurrenceDepositeGrid(true);
                BindRecurrenceDepositesGrid();
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
        protected void btnNewRecurrenceDeposite_Click(object sender, EventArgs e)
        {
            try
            {
                ClearRDControls();
                ShowHideRecurrenceDepositeGrid(false);
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
        protected void ddlRDPager_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ClearRDControls();
                ShowHideRecurrenceDepositeGrid(true);
                BindRecurrenceDepositesGrid();
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
        protected void gvRecurrenceDeposite_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvRecurrenceDeposite.PageIndex = e.NewPageIndex;
                BindRecurrenceDepositesGrid();
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
        protected void gvRecurrenceDeposite_RowEditing(object sender, GridViewEditEventArgs e)
        {
            objRecurrenceDeposite = new clsRecurrenceDeposite();
            dtRecurrenceDeposite = new DataTable();
            int iRecurrenceDepositeId;
            try
            {
                iRecurrenceDepositeId = Convert.ToInt32(((Label)gvRecurrenceDeposite.Rows[e.NewEditIndex].FindControl("lblRecurrenceDepositeId")).Text);
                if (iRecurrenceDepositeId > 0)
                {
                    objRecurrenceDeposite.RecurrenceDepositeId = iRecurrenceDepositeId;
                    dtRecurrenceDeposite = objRecurrenceDeposite.GetRecurrenceDepositeDetailsByRecurrenceDepositeId();
                    if (dtRecurrenceDeposite.Rows.Count > 0)
                    {
                        //Fill Recurrence Deposite Information
                        hdnRecurrenceDepositeId.Value = dtRecurrenceDeposite.Rows[0]["RecurrenceDepositeId"].ToString();
                        hdnCustomerId.Value = dtRecurrenceDeposite.Rows[0]["CustomerId"].ToString();
                        txtRDCustomerNo.Text = dtRecurrenceDeposite.Rows[0]["CustomerCode"].ToString();
                        txtRecurrenceDepositeDate.Text = dtRecurrenceDeposite.Rows[0]["RecurrenceDepositeDate"].ToString();
                        ddlCustomerType.SelectedIndex = ddlCustomerType.Items.IndexOf(ddlCustomerType.Items.FindByValue(dtRecurrenceDeposite.Rows[0]["CustomerTypeId"].ToString()));
                        ddlRDCustomernamePrefix.SelectedIndex = ddlRDCustomernamePrefix.Items.IndexOf(ddlRDCustomernamePrefix.Items.FindByText(dtRecurrenceDeposite.Rows[0]["CustomerNamePrifix"].ToString()));
                        txtRDCusotmerFirstname.Text = dtRecurrenceDeposite.Rows[0]["CustomerFirstName"].ToString();
                        txtRDCustomerMiddlename.Text = dtRecurrenceDeposite.Rows[0]["CustomerMiddleName"].ToString();
                        txtRDCustomerLastname.Text = dtRecurrenceDeposite.Rows[0]["CustomerLastName"].ToString();
                        txtRecurrenceDepositeAmount.Text = string.Format("{0:0.##}", dtRecurrenceDeposite.Rows[0]["RecurrenceDepositeAmount"]);

                        //Bind Recurrence Deposite Types as per customer Type
                        BindRecurrenceDepositeTypes();
                        ddlRecurrenceDepositeType.SelectedIndex = ddlRecurrenceDepositeType.Items.IndexOf(ddlRecurrenceDepositeType.Items.FindByValue(dtRecurrenceDeposite.Rows[0]["RecurrenceDepositeTypeId"].ToString()));


                        //Then Bind Recurrence Deposite Periods and Interest Rate.
                        BindRecurrenceDepositePeriods();
                        ddlRecurrenceDepositePeriodYears.SelectedIndex = ddlRecurrenceDepositePeriodYears.Items.IndexOf(ddlRecurrenceDepositePeriodYears.Items.FindByValue(dtRecurrenceDeposite.Rows[0]["RecurrenceDepositePeriods"].ToString()));
                        txtRDInterestRate.Text = dtRecurrenceDeposite.Rows[0]["RecurrenceDepositeInterestRate"].ToString();
                        txtRecurrenceDepositeAmount.Text = CommonFunctions.FormatMoneyString(Convert.ToDecimal(dtRecurrenceDeposite.Rows[0]["RecurrenceDepositeAmount"]));
                        txtRDMaturityDate.Text = dtRecurrenceDeposite.Rows[0]["MaturityDate"].ToString();
                        txtRDMaturityAmt.Text = string.Format("{0:0.##}", dtRecurrenceDeposite.Rows[0]["MaturityAmount"]);

                        //Fill Nominee Information
                        hdnNomineeId.Value = dtRecurrenceDeposite.Rows[0]["NomineeId"].ToString();
                        ddlRDNomineePrefix.SelectedIndex = ddlRDNomineePrefix.Items.IndexOf(ddlRDNomineePrefix.Items.FindByText(dtRecurrenceDeposite.Rows[0]["NomineeNamePrefix"].ToString()));
                        txtRDNomineeFirstname.Text = dtRecurrenceDeposite.Rows[0]["NomineeFirstName"].ToString();
                        txtRDNomineeMiddlename.Text = dtRecurrenceDeposite.Rows[0]["NomineeMiddleName"].ToString();
                        txtRDNomineeLastname.Text = dtRecurrenceDeposite.Rows[0]["NomineeLastName"].ToString();
                        txtRDNomineeAddress.Text = dtRecurrenceDeposite.Rows[0]["NomineeAddress"].ToString();
                        ddlRDNomineeVillage.SelectedIndex = ddlRDNomineeVillage.Items.IndexOf(ddlRDNomineeVillage.Items.FindByValue(dtRecurrenceDeposite.Rows[0]["NomineeVillageId"].ToString())); ;
                        ddlRDNomineeTaluka.SelectedIndex = ddlRDNomineeTaluka.Items.IndexOf(ddlRDNomineeTaluka.Items.FindByValue(dtRecurrenceDeposite.Rows[0]["NomineeTahsilId"].ToString())); ;
                        ddlRDNomineeDistrict.SelectedIndex = ddlRDNomineeDistrict.Items.IndexOf(ddlRDNomineeDistrict.Items.FindByValue(dtRecurrenceDeposite.Rows[0]["NomineeDistrictId"].ToString())); ;
                        txtRDNomineePinCode.Text = dtRecurrenceDeposite.Rows[0]["NomineePinCode"].ToString();
                        txtRDNomineePhonenumber.Text = dtRecurrenceDeposite.Rows[0]["NomineePhoneNumber"].ToString();

                        EnableDisableRecurrenceDepositeControls(false);
                    }

                    ShowHideRecurrenceDepositeGrid(false);
                }
            }
            catch
            {
            }
            finally
            {
                objRecurrenceDeposite = null;
                dtRecurrenceDeposite = null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSaveRecurrenceDepoisite_Click(object sender, EventArgs e)
        {
            objRecurrenceDeposite = new clsRecurrenceDeposite();
            objNominee = new clsNominees();
            try
            {
                if (Page.IsValid)
                {
                    if (!string.IsNullOrEmpty(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString())))
                    {
                        objRecurrenceDeposite.RecurrenceDepositeId = !string.IsNullOrEmpty(hdnRecurrenceDepositeId.Value) ? Convert.ToInt32(hdnRecurrenceDepositeId.Value.ToString()) : 0;
                        objRecurrenceDeposite.CustomerId = !string.IsNullOrEmpty(hdnCustomerId.Value) ? Convert.ToInt32(hdnCustomerId.Value.ToString()) : 0;
                        objRecurrenceDeposite.RecurrenceDepositeTypeId = !string.IsNullOrEmpty(ddlRecurrenceDepositePeriodYears.SelectedValue) ? Convert.ToInt32(ddlRecurrenceDepositePeriodYears.SelectedValue.ToString()) : 0;
                        objRecurrenceDeposite.RecurrenceDepositeDate = !string.IsNullOrEmpty(txtRecurrenceDepositeDate.Text) ? txtRecurrenceDepositeDate.Text : string.Empty;
                        objRecurrenceDeposite.RecurrenceDepositeAmount = !string.IsNullOrEmpty(txtRecurrenceDepositeAmount.Text) ? Convert.ToDecimal(txtRecurrenceDepositeAmount.Text) : 0;
                        objRecurrenceDeposite.MaturityDate = !string.IsNullOrEmpty(txtRDMaturityDate.Text) ? txtRDMaturityDate.Text : string.Empty;
                        objRecurrenceDeposite.MaturityAmount = !string.IsNullOrEmpty(txtRDMaturityAmt.Text) ? Convert.ToDecimal(txtRDMaturityAmt.Text) : 0;
                        objRecurrenceDeposite.IsClosed = false;
                        objRecurrenceDeposite.ClosedDate = string.Empty;
                        objRecurrenceDeposite.CreatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                        objRecurrenceDeposite.CreatedDate = Convert.ToDateTime(txtRecurrenceDepositeDate.Text);
                        objRecurrenceDeposite.UpdatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                        objRecurrenceDeposite.UpdatedDate = Convert.ToDateTime(txtRecurrenceDepositeDate.Text);
                        objRecurrenceDeposite.IsActive = true;

                        if (objRecurrenceDeposite.Insert())
                        {
                            //Customer Nominee Details
                            objNominee.NomineeId = !string.IsNullOrEmpty(hdnNomineeId.Value) ? Convert.ToInt32(hdnNomineeId.Value.ToString()) : 0;
                            objNominee.NomineeReferenceId = objRecurrenceDeposite.RecurrenceDepositeId > 0 ? objRecurrenceDeposite.RecurrenceDepositeId : 0;
                            objNominee.NomineeTypeId = Convert.ToInt32(clsEnum.NomineeType.RecurrenceDeposite.GetHashCode().ToString());
                            objNominee.NamePrefix = !string.IsNullOrEmpty(ddlRDNomineePrefix.SelectedValue) ? ddlRDNomineePrefix.SelectedValue.ToString() : string.Empty;
                            objNominee.FirstName = !string.IsNullOrEmpty(txtRDNomineeFirstname.Text) ? txtRDNomineeFirstname.Text.ToString() : string.Empty;
                            objNominee.MiddleName = !string.IsNullOrEmpty(txtRDNomineeMiddlename.Text) ? txtRDNomineeMiddlename.Text.ToString() : string.Empty;
                            objNominee.LastName = !string.IsNullOrEmpty(txtRDNomineeLastname.Text) ? txtRDNomineeLastname.Text.ToString() : string.Empty;
                            objNominee.Address = !string.IsNullOrEmpty(txtRDNomineeAddress.Text) ? txtRDNomineeAddress.Text.ToString() : string.Empty;
                            objNominee.VillageId = !string.IsNullOrEmpty(ddlRDNomineeVillage.Text) ? ddlRDNomineeVillage.Text.ToString() : string.Empty;
                            objNominee.TahsilId = !string.IsNullOrEmpty(ddlRDNomineeTaluka.SelectedValue) ? Convert.ToInt32(ddlRDNomineeTaluka.SelectedValue.ToString()) : 0;
                            objNominee.DistrictId = !string.IsNullOrEmpty(ddlRDNomineeDistrict.SelectedValue) ? Convert.ToInt32(ddlRDNomineeDistrict.SelectedValue.ToString()) : 0;
                            objNominee.PinCode = !string.IsNullOrEmpty(txtRDNomineePinCode.Text) ? txtRDNomineePinCode.Text.ToString() : string.Empty;
                            objNominee.PhoneNumber = !string.IsNullOrEmpty(txtRDNomineePhonenumber.Text) ? txtRDNomineePhonenumber.Text.ToString() : string.Empty;
                            objNominee.CreatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                            objNominee.CreatedDate = Convert.ToDateTime(txtRecurrenceDepositeDate.Text);
                            objNominee.UpdatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                            objNominee.UpdatedDate = Convert.ToDateTime(txtRecurrenceDepositeDate.Text);
                            objNominee.IsActive = true;
                            objNominee.Insert();

                            lblRecurrenceDepositeMessage.CssClass = "SuccessfulMessage";
                            lblRecurrenceDepositeMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavedSuccessfully");
                        }
                        else
                        {
                            lblRecurrenceDepositeMessage.CssClass = "FailureMessage";
                            lblRecurrenceDepositeMessage.Text = (String)GetGlobalResourceObject("SharedResource", "LoginSessionExpire");
                        }
                    }
                }
                ClearRDControls();
                EnableDisableRecurrenceDepositeControls(true);
                BindRecurrenceDepositesGrid();
                ShowHideRecurrenceDepositeGrid(true);
            }
            catch
            {
            }
            finally
            {
                objRecurrenceDeposite = null;
                objNominee = null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelRecurrenceDeposite_Click(object sender, EventArgs e)
        {
            try
            {
                ClearRDControls();
                EnableDisableRecurrenceDepositeControls(true);
                BindRecurrenceDepositesGrid();
                ShowHideRecurrenceDepositeGrid(true);
            }
            catch
            {
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 31-12-2012
        /// Desc : Open Customer Search Popup.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
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
        /// Added By : Himanshu Pandya
        /// Date : 31-12-2012
        /// Desc : Handle Cusotmer Search Popup Ok click and Fill Customer.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="args"></param>
        public void ucCustomerSearch_OkButtonPressed(object sender, EventArgs args)
        {
            try
            {
                if (ucRDCustomerSearch.CustomerID > 0)
                {
                    hdnCustomerId.Value = Convert.ToString(ucRDCustomerSearch.CustomerID);
                    BindCustomerDetails();
                    mpeCustSearchPopUp.Hide();
                }
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
        protected void ddlRecurrenceDepositeType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindRecurrenceDepositePeriods();
            }
            catch (Exception ex)
            {
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlRecurrenceDepositePeriodYears_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindRecurrenceDepositeMaturityDetails();
            }
            catch (Exception ex)
            {
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 08-03-2013
        /// Desc : 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void txtRecurrenceDepositeAmount_TextChanged(object sender, EventArgs e)
        {
            try
            {
                BindRecurrenceDepositeMaturityDetails();
            }
            catch
            { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 08-03-2013
        /// Desc : Close Recurrence Deposite
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCloseRecurrenceDeposite_Click(object sender, EventArgs e)
        {
            clsRecurrenceDeposite objRecurrenceDeposite = new clsRecurrenceDeposite();
            try
            {
                if ((!string.IsNullOrEmpty(hdnRecurrenceDepositeId.Value)) && (!string.IsNullOrEmpty(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()))))
                {
                    objRecurrenceDeposite.RecurrenceDepositeId = Convert.ToInt32(hdnRecurrenceDepositeId.Value.ToString());
                    objRecurrenceDeposite.IsClosed = true;
                    objRecurrenceDeposite.ClosedDate = String.Format("{0:dd/MM/yyyy}", DateTime.Now);
                    objRecurrenceDeposite.UpdatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString())); ;
                    objRecurrenceDeposite.UpdatedDate = Convert.ToDateTime(txtRecurrenceDepositeDate.Text);
                    objRecurrenceDeposite.IsActive = false;
                    if (objRecurrenceDeposite.CloseRecurrenceDepositeByRecurrenceDepositeId())
                    {
                        lblRecurrenceDepositeMessage.CssClass = "SuccessfulMessage";
                        lblRecurrenceDepositeMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavedSuccessfully");
                    }
                    else
                    {
                        lblRecurrenceDepositeMessage.CssClass = "FailureMessage";
                        lblRecurrenceDepositeMessage.Text = (String)GetGlobalResourceObject("SharedResource", "LoginSessionExpire");
                    }
                    ClearRDControls();
                    BindRecurrenceDepositesGrid();
                    EnableDisableRecurrenceDepositeControls(true);
                    ShowHideRecurrenceDepositeGrid(true);
                }
            }
            catch
            { }
        }
        #endregion
    }
}