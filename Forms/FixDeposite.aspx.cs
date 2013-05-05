using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Raigad.UserControls;
using System.Data;

namespace Raigad.Forms
{
    public partial class FixDeposite : System.Web.UI.Page
    {
        #region Global Variables Declarions
        clsCustomer objCustomer;
        DataTable dtCustomer;
        clsFixDeposite objFixDeposite;
        clsNominees objNominee;
        #endregion

        #region Methods

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Bind Fix Deposite Details
        /// </summary>
        public void BindFixDepositesGrid()
        {
            objFixDeposite = new clsFixDeposite();
            DataTable dtFixDeposite = new DataTable();
            try
            {
                if (!string.IsNullOrEmpty(txtSearchFD.Text) && !string.IsNullOrEmpty(ddlFDSearch.SelectedValue))
                {
                    string strsearch = ddlFDSearch.SelectedValue.ToString();
                    switch (strsearch)
                    {
                        case "CusotmerName":
                            objFixDeposite.CustomerFirstName = txtSearchFD.Text.ToString();
                            break;
                    }
                }
                else
                {
                    objFixDeposite.CustomerFirstName = string.Empty;
                }

                dtFixDeposite = objFixDeposite.SearcheAllFixDepositeWSearchFilters();
                if (dtFixDeposite.Rows.Count > 0)
                {
                    gvFixDeposite.DataSource = dtFixDeposite;
                }
                else
                {
                    gvFixDeposite.DataSource = null;
                }

                gvFixDeposite.PageSize = Convert.ToInt32(ddlFDPager.SelectedValue.ToString());
                gvFixDeposite.DataBind();
            }
            catch
            {
            }
            finally
            {
                objFixDeposite = null;
                dtFixDeposite = null;
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Show Hide Fix Deposite Grid
        /// </summary>
        /// <param name="IsShow"></param>
        public void ShowHideFixDepositeGrid(bool IsShow)
        {
            if (IsShow) { divFDGrid.Style.Add("display", "block"); divNewFDPopup.Style.Add("display", "none"); }
            else { divFDGrid.Style.Add("display", "none"); divNewFDPopup.Style.Add("display", "block"); }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Clear All Fix Deposite Controls
        /// </summary>
        public void ClearFDControls()
        {
            try
            {
                hdnCustomerId.Value = string.Empty;
                hdnFixDepositeId.Value = string.Empty;
                hdnNomineeId.Value = string.Empty;
                txtSearchFD.Text = string.Empty;
                ddlFDSearch.SelectedIndex = 0;

                //Clear Fix Deposite Controls
                txtFDCustomerNo.Text = string.Empty;
                txtFixDepositeDate.Text = DateTime.Now.ToString("yyyy/MM/dd");
                ddlCustomerType.SelectedIndex = 0;
                ddlFDCustomernamePrefix.SelectedIndex = 0;
                txtFDCusotmerFirstname.Text = string.Empty;
                txtFDCustomerMiddlename.Text = string.Empty;
                txtFDCustomerLastname.Text = string.Empty;
                ddlFixDepositeType.SelectedIndex = 0;
                txtFixDepositeAmount.Text = string.Empty;
                ddlFDPeriodYears.SelectedIndex = 0;
                txtFDInterestRate.Text = string.Empty;
                txtFDMaturityDate.Text = string.Empty;
                txtFDMaturityAmt.Text = string.Empty;

                //Clear Fix Deposite Nominee Controls
                ddlFDNomineePrefix.SelectedIndex = 0;
                txtFDNomineeFirstname.Text = string.Empty;
                txtFDNomineeMiddlename.Text = string.Empty;
                txtFDNomineeLastname.Text = string.Empty;
                txtFDNomineeAddress.Text = string.Empty;
                ddlFDNomineeVillage.SelectedIndex = 0;
                ddlFDNomineeTaluka.SelectedIndex = 0;
                ddlFDNomineeDistrict.SelectedIndex = 0;
                txtFDNomineePinCode.Text = string.Empty;
                txtFDNomineePhonenumber.Text = string.Empty;
            }
            catch
            {
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
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
                        txtFDCustomerNo.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["CustomerCode"].ToString()) ? dtCustomer.Rows[0]["CustomerCode"].ToString() : string.Empty;
                        ddlCustomerType.SelectedIndex = ddlCustomerType.Items.IndexOf(ddlCustomerType.Items.FindByText(dtCustomer.Rows[0]["CustomerTypeName"].ToString()));
                        ddlFDCustomernamePrefix.SelectedIndex = ddlFDCustomernamePrefix.Items.IndexOf(ddlFDCustomernamePrefix.Items.FindByText(dtCustomer.Rows[0]["NamePrifix"].ToString()));
                        txtFDCusotmerFirstname.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["FirstName"].ToString()) ? dtCustomer.Rows[0]["FirstName"].ToString() : string.Empty;
                        txtFDCustomerMiddlename.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["MiddleName"].ToString()) ? dtCustomer.Rows[0]["MiddleName"].ToString() : string.Empty;
                        txtFDCustomerLastname.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["LastName"].ToString()) ? dtCustomer.Rows[0]["LastName"].ToString() : string.Empty;

                        BindFixDepositeTypes();
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
        /// Date : 30-12-2012
        /// Desc : Bind Fix Deposite Types
        /// </summary>
        public void BindFixDepositeTypes()
        {
            try
            {
                if (!string.IsNullOrEmpty(ddlCustomerType.SelectedValue.ToString()))
                {
                    if (ddlCustomerType.SelectedValue.ToString().Equals(clsEnum.CustomerType.Sadharan.GetHashCode().ToString()))
                    {
                        CommonFunctions.BindFixDepositeTypes(ddlFixDepositeType, clsEnum.CustomerCode.General.ToString());
                    }
                    else if (ddlCustomerType.SelectedValue.ToString().Equals(clsEnum.CustomerType.NaamMatra.GetHashCode().ToString()))
                    {
                        CommonFunctions.BindFixDepositeTypes(ddlFixDepositeType, clsEnum.CustomerCode.Senior.ToString());
                    }

                }
                else
                {
                    CommonFunctions.BindFixDepositeTypes(ddlFixDepositeType, string.Empty);
                }
            }
            catch
            {
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Bind Nominee Villages
        /// </summary>
        public void BindNomineeVillage()
        {
            try
            {
                CommonFunctions.BindVillages(ddlFDNomineeVillage);
            }
            catch { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Bind Nominee Tahsils
        /// </summary>
        public void BindNomineeTahsil()
        {
            try
            {
                CommonFunctions.BindTahsils(ddlFDNomineeTaluka);
            }
            catch { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Bind Nominee Districts
        /// </summary>
        public void BindNomineeDistrict()
        {
            try
            {
                CommonFunctions.BindDistricts(ddlFDNomineeDistrict);
            }
            catch { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 06-01-2013
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
        /// Date : 06-01-2013
        /// Desc : Bind Fix Deposite Periods.
        /// </summary>
        /// <param name="FixDepositeTypeId"></param>
        public void BindFixDepositePeriods()
        {
            objFixDeposite = new clsFixDeposite();
            DataTable dtFixDeposite = new DataTable();
            try
            {
                if (!string.IsNullOrEmpty(ddlFixDepositeType.SelectedValue.ToString()))
                {
                    ddlFDPeriodYears.Items.Clear();
                    objFixDeposite.FixDepositeTypeId = Convert.ToInt32(ddlFixDepositeType.SelectedValue.ToString());
                    dtFixDeposite = objFixDeposite.GetFixDepositePeriodsByFixDepositeTypeId();
                    {
                        ddlFDPeriodYears.DataSource = dtFixDeposite;
                        ddlFDPeriodYears.DataValueField = "FixDepositeTypeId";
                        ddlFDPeriodYears.DataTextField = "FixDepositeTypeDesc";
                        ddlFDPeriodYears.DataBind();
                    }
                    ddlFDPeriodYears.Items.Insert(0, new ListItem("fuoMk", ""));
                }
            }
            catch
            {
            }
            finally
            {
                objFixDeposite = null;
                dtFixDeposite = null;
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 06-01-2012
        /// Desc : Bind FixDeposite Maturity Details.
        /// </summary>
        public void BindFixDepositeMaturityDetails()
        {
            objFixDeposite = new clsFixDeposite();
            DataTable dtFixDeposite = new DataTable();
            try
            {
                if (!string.IsNullOrEmpty(ddlFDPeriodYears.SelectedValue.ToString()))
                {
                    objFixDeposite.FixDepositeTypeId = Convert.ToInt32(ddlFDPeriodYears.SelectedValue);
                    objFixDeposite.FixDepositeAmount = !string.IsNullOrEmpty(txtFixDepositeAmount.Text) ? Convert.ToDecimal(txtFixDepositeAmount.Text) : 0;
                    objFixDeposite.FixDepositeDate = !string.IsNullOrEmpty(txtFixDepositeDate.Text) ? txtFixDepositeDate.Text : string.Empty;
                    dtFixDeposite = objFixDeposite.GetFixDepositeMaturityDetailsByFixDepositeTypeId();
                    if (dtFixDeposite.Rows.Count > 0)
                    {
                        txtFDInterestRate.Text = dtFixDeposite.Rows[0]["FixDepositeDate"].ToString();
                        txtFDMaturityDate.Text = dtFixDeposite.Rows[0]["MaturityDate"].ToString();
                        txtFDMaturityAmt.Text = CommonFunctions.FormatMoneyString(Convert.ToDecimal(dtFixDeposite.Rows[0]["MaturityAmount"]));
                    }
                }
            }
            catch
            { }
            finally
            {
                objFixDeposite = null;
                dtFixDeposite = null;
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 08-01-2013
        /// Desc :
        /// </summary>
        /// <param name="IsEnable"></param>
        public void EnableDisableFixDepositeControls(bool IsEnable)
        {
            try
            {
                txtFixDepositeDate.Enabled = IsEnable;
                ibtnFixDepositeDate.Enabled = IsEnable;
                txtFDCustomerNo.Enabled = IsEnable;
                ddlCustomerType.Enabled = IsEnable;
                ddlFDCustomernamePrefix.Enabled = IsEnable;
                txtFDCusotmerFirstname.Enabled = IsEnable;
                txtFDCustomerMiddlename.Enabled = IsEnable;
                txtFDCustomerLastname.Enabled = IsEnable;
                ddlFixDepositeType.Enabled = IsEnable;
                txtFixDepositeAmount.Enabled = IsEnable;
                ddlFDPeriodYears.Enabled = IsEnable;
                txtFDInterestRate.Enabled = IsEnable;
                txtFDMaturityDate.Enabled = IsEnable;
                ibtnFDMaturityDate.Enabled = IsEnable;
                txtFDMaturityAmt.Enabled = IsEnable;

                //Clear Fix Deposite Nominee Controls
                ddlFDNomineePrefix.Enabled = IsEnable;
                txtFDNomineeFirstname.Enabled = IsEnable;
                txtFDNomineeMiddlename.Enabled = IsEnable;
                txtFDNomineeLastname.Enabled = IsEnable;
                txtFDNomineeAddress.Enabled = IsEnable;
                ddlFDNomineeVillage.Enabled = IsEnable;
                ddlFDNomineeTaluka.Enabled = IsEnable;
                ddlFDNomineeDistrict.Enabled = IsEnable;
                txtFDNomineePinCode.Enabled = IsEnable;
                txtFDNomineePhonenumber.Enabled = IsEnable;

                lnkOpenCustomerSearch.Enabled = IsEnable;
                btnSaveFixDepoisite.Visible = IsEnable;

                if (IsEnable)
                {
                    btnSaveFixDepoisite.Visible = true;
                    btnCloseFixDeposite.Visible = false;
                }
                else
                {
                    btnSaveFixDepoisite.Visible = false;
                    btnCloseFixDeposite.Visible = true;
                }
            }
            catch
            { }
        }
        #endregion

        #region Events

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Page Load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ucCustomerSearch.OkButtonPressed += new CustomerSearch.OkButtonPressedHandler(ucCustomerSearch_OkButtonPressed);
                if (!IsPostBack)
                {
                    ClearFDControls();
                    ShowHideFixDepositeGrid(true);
                    BindCustomerTypes();
                    BindFixDepositeTypes();
                    BindNomineeVillage();
                    BindNomineeTahsil();
                    BindNomineeDistrict();
                    BindFixDepositesGrid();
                }
                lblFixDepositeMessage.Text = string.Empty;
            }
            catch
            {
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Search Fix Deposite Details
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearchFD_Click(object sender, EventArgs e)
        {
            try
            {
                ShowHideFixDepositeGrid(true);
                BindFixDepositesGrid();
            }
            catch
            {
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Clearc Fix Deposite Controls
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnClearFD_Click(object sender, EventArgs e)
        {
            try
            {
                ClearFDControls();
                ShowHideFixDepositeGrid(true);
                BindFixDepositesGrid();
            }
            catch
            {
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Create New Fix Deposite
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNewFixDeposite_Click(object sender, EventArgs e)
        {
            try
            {
                ClearFDControls();
                ShowHideFixDepositeGrid(false);
            }
            catch
            {
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Set Fix Deposite Grid Page size.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlFDPager_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ClearFDControls();
                ShowHideFixDepositeGrid(true);
                BindFixDepositesGrid();
            }
            catch
            {
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Fix Deposite GridRow Editing.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvFixDeposite_RowEditing(object sender, GridViewEditEventArgs e)
        {
            objFixDeposite = new clsFixDeposite();
            DataTable dtFixDeposite = new DataTable();
            int iFixDepositeId;
            try
            {
                iFixDepositeId = Convert.ToInt32(((Label)gvFixDeposite.Rows[e.NewEditIndex].FindControl("lblFixDepositeId")).Text);
                if (iFixDepositeId > 0)
                {
                    objFixDeposite.FixDepositeId = iFixDepositeId;
                    dtFixDeposite = objFixDeposite.GetFixDepositeDetailsByFixDepositeId();
                    if (dtFixDeposite.Rows.Count > 0)
                    {
                        //Fill Fix Deposite Information
                        hdnFixDepositeId.Value = dtFixDeposite.Rows[0]["FixDepositeId"].ToString();
                        hdnCustomerId.Value = dtFixDeposite.Rows[0]["CustomerId"].ToString();
                        txtFDCustomerNo.Text = dtFixDeposite.Rows[0]["CustomerCode"].ToString();
                        txtFixDepositeDate.Text = dtFixDeposite.Rows[0]["FixDepositeDate"].ToString();
                        ddlCustomerType.SelectedIndex = ddlCustomerType.Items.IndexOf(ddlCustomerType.Items.FindByValue(dtFixDeposite.Rows[0]["CustomerTypeId"].ToString()));
                        ddlFDCustomernamePrefix.SelectedIndex = ddlFDCustomernamePrefix.Items.IndexOf(ddlFDCustomernamePrefix.Items.FindByText(dtFixDeposite.Rows[0]["CustomerNamePrifix"].ToString()));
                        txtFDCusotmerFirstname.Text = dtFixDeposite.Rows[0]["CustomerFirstName"].ToString();
                        txtFDCustomerMiddlename.Text = dtFixDeposite.Rows[0]["CustomerMiddleName"].ToString();
                        txtFDCustomerLastname.Text = dtFixDeposite.Rows[0]["CustomerLastName"].ToString();

                        //Bind FD Types as per customer Type
                        BindFixDepositeTypes();
                        ddlFixDepositeType.SelectedIndex = ddlFixDepositeType.Items.IndexOf(ddlFixDepositeType.Items.FindByValue(dtFixDeposite.Rows[0]["FixDepositeTypeId"].ToString()));


                        //Then Bind Fix Deposite Periods and Interest Rate.
                        BindFixDepositePeriods();
                        ddlFDPeriodYears.SelectedIndex = ddlFDPeriodYears.Items.IndexOf(ddlFDPeriodYears.Items.FindByValue(dtFixDeposite.Rows[0]["FixDepositePeriods"].ToString()));
                        txtFDInterestRate.Text = dtFixDeposite.Rows[0]["FixDepositeInterestRate"].ToString();

                        txtFixDepositeAmount.Text = CommonFunctions.FormatMoneyString(Convert.ToDecimal(dtFixDeposite.Rows[0]["FixDepositeAmount"]));
                        txtFDMaturityDate.Text = dtFixDeposite.Rows[0]["MaturityDate"].ToString();
                        txtFDMaturityAmt.Text = CommonFunctions.FormatMoneyString(Convert.ToDecimal(dtFixDeposite.Rows[0]["MaturityAmount"]));

                        //Fill Nominee Information
                        hdnNomineeId.Value = dtFixDeposite.Rows[0]["NomineeId"].ToString();
                        ddlFDNomineePrefix.SelectedIndex = ddlFDNomineePrefix.Items.IndexOf(ddlFDNomineePrefix.Items.FindByText(dtFixDeposite.Rows[0]["NomineeNamePrefix"].ToString()));
                        txtFDNomineeFirstname.Text = dtFixDeposite.Rows[0]["NomineeFirstName"].ToString();
                        txtFDNomineeMiddlename.Text = dtFixDeposite.Rows[0]["NomineeMiddleName"].ToString();
                        txtFDNomineeLastname.Text = dtFixDeposite.Rows[0]["NomineeLastName"].ToString();
                        txtFDNomineeAddress.Text = dtFixDeposite.Rows[0]["NomineeAddress"].ToString();
                        ddlFDNomineeVillage.SelectedIndex = ddlFDNomineeVillage.Items.IndexOf(ddlFDNomineeVillage.Items.FindByValue(dtFixDeposite.Rows[0]["NomineeVillageId"].ToString())); ;
                        ddlFDNomineeTaluka.SelectedIndex = ddlFDNomineeTaluka.Items.IndexOf(ddlFDNomineeTaluka.Items.FindByValue(dtFixDeposite.Rows[0]["NomineeTahsilId"].ToString())); ;
                        ddlFDNomineeDistrict.SelectedIndex = ddlFDNomineeDistrict.Items.IndexOf(ddlFDNomineeDistrict.Items.FindByValue(dtFixDeposite.Rows[0]["NomineeDistrictId"].ToString())); ;
                        txtFDNomineePinCode.Text = dtFixDeposite.Rows[0]["NomineePinCode"].ToString();
                        txtFDNomineePhonenumber.Text = dtFixDeposite.Rows[0]["NomineePhoneNumber"].ToString();

                        EnableDisableFixDepositeControls(false);
                    }
                    ShowHideFixDepositeGrid(false);
                }
            }
            catch
            {
            }
            finally
            {
                objFixDeposite = null;
                dtFixDeposite = null;
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Fix Deposite Grid Page Index Change.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvFixDeposite_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvFixDeposite.PageIndex = e.NewPageIndex;
            BindFixDepositesGrid();
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Save New Fix Deposite Details
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSaveFixDepoisite_Click(object sender, EventArgs e)
        {
            objFixDeposite = new clsFixDeposite();
            objNominee = new clsNominees();
            try
            {
                if (Page.IsValid)
                {
                    if (!string.IsNullOrEmpty(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString())))
                    {
                        objFixDeposite.FixDepositeId = !string.IsNullOrEmpty(hdnFixDepositeId.Value) ? Convert.ToInt32(hdnFixDepositeId.Value.ToString()) : 0;
                        objFixDeposite.CustomerId = !string.IsNullOrEmpty(hdnCustomerId.Value) ? Convert.ToInt32(hdnCustomerId.Value.ToString()) : 0;
                        objFixDeposite.FixDepositeDate = !string.IsNullOrEmpty(txtFixDepositeDate.Text) ? txtFixDepositeDate.Text : string.Empty;
                        objFixDeposite.FixDepositeTypeId = !string.IsNullOrEmpty(ddlFDPeriodYears.SelectedValue) ? Convert.ToInt32(ddlFDPeriodYears.SelectedValue.ToString()) : 0;
                        objFixDeposite.FixDepositeAmount = !string.IsNullOrEmpty(txtFixDepositeAmount.Text) ? Convert.ToDecimal(txtFixDepositeAmount.Text) : 0;
                        objFixDeposite.MaturityDate = !string.IsNullOrEmpty(txtFDMaturityDate.Text) ? txtFDMaturityDate.Text : string.Empty;
                        objFixDeposite.MaturityAmount = !string.IsNullOrEmpty(txtFDMaturityAmt.Text) ? Convert.ToDecimal(txtFDMaturityAmt.Text) : 0;
                        objFixDeposite.IsClosed = false;
                        objFixDeposite.ClosedDate = string.Empty;
                        objFixDeposite.CreatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                        objFixDeposite.CreatedDate = Convert.ToDateTime(txtFixDepositeDate.Text);
                        objFixDeposite.UpdatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                        objFixDeposite.UpdatedDate = Convert.ToDateTime(txtFixDepositeDate.Text);
                        objFixDeposite.IsActive = true;

                        if (objFixDeposite.Insert())
                        {
                            //Customer Nominee Details
                            objNominee.NomineeId = !string.IsNullOrEmpty(hdnNomineeId.Value) ? Convert.ToInt32(hdnNomineeId.Value.ToString()) : 0;
                            objNominee.NomineeReferenceId = objFixDeposite.FixDepositeId > 0 ? objFixDeposite.FixDepositeId : 0;
                            objNominee.NomineeTypeId = Convert.ToInt32(clsEnum.NomineeType.FixDeposite.GetHashCode().ToString());
                            objNominee.NamePrefix = !string.IsNullOrEmpty(ddlFDNomineePrefix.SelectedValue) ? ddlFDNomineePrefix.SelectedValue.ToString() : string.Empty;
                            objNominee.FirstName = !string.IsNullOrEmpty(txtFDNomineeFirstname.Text) ? txtFDNomineeFirstname.Text.ToString() : string.Empty;
                            objNominee.MiddleName = !string.IsNullOrEmpty(txtFDNomineeMiddlename.Text) ? txtFDNomineeMiddlename.Text.ToString() : string.Empty;
                            objNominee.LastName = !string.IsNullOrEmpty(txtFDNomineeLastname.Text) ? txtFDNomineeLastname.Text.ToString() : string.Empty;
                            objNominee.Address = !string.IsNullOrEmpty(txtFDNomineeAddress.Text) ? txtFDNomineeAddress.Text.ToString() : string.Empty;
                            objNominee.VillageId = !string.IsNullOrEmpty(ddlFDNomineeVillage.Text) ? ddlFDNomineeVillage.Text.ToString() : string.Empty;
                            objNominee.TahsilId = !string.IsNullOrEmpty(ddlFDNomineeTaluka.SelectedValue) ? Convert.ToInt32(ddlFDNomineeTaluka.SelectedValue.ToString()) : 0;
                            objNominee.DistrictId = !string.IsNullOrEmpty(ddlFDNomineeDistrict.SelectedValue) ? Convert.ToInt32(ddlFDNomineeDistrict.SelectedValue.ToString()) : 0;
                            objNominee.PinCode = !string.IsNullOrEmpty(txtFDNomineePinCode.Text) ? txtFDNomineePinCode.Text.ToString() : string.Empty;
                            objNominee.PhoneNumber = !string.IsNullOrEmpty(txtFDNomineePhonenumber.Text) ? txtFDNomineePhonenumber.Text.ToString() : string.Empty;
                            objNominee.CreatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                            objNominee.CreatedDate = Convert.ToDateTime(txtFixDepositeDate.Text);
                            objNominee.UpdatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                            objNominee.UpdatedDate = Convert.ToDateTime(txtFixDepositeDate.Text);
                            objNominee.IsActive = true;
                            objNominee.Insert();

                            lblFixDepositeMessage.CssClass = "SuccessfulMessage";
                            lblFixDepositeMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavedSuccessfully");
                        }
                        else
                        {
                            lblFixDepositeMessage.CssClass = "FailureMessage";
                            lblFixDepositeMessage.Text = (String)GetGlobalResourceObject("SharedResource", "LoginSessionExpire");
                        }
                    }
                }
                ClearFDControls();
                BindFixDepositesGrid();
                ShowHideFixDepositeGrid(true);
            }
            catch
            {
            }
            finally
            {
                objFixDeposite = null;
                objNominee = null;
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Cancel Saving Fix Deposite Details
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelFixDeposite_Click(object sender, EventArgs e)
        {
            try
            {
                ClearFDControls();
                BindFixDepositesGrid();
                EnableDisableFixDepositeControls(true);
                ShowHideFixDepositeGrid(true);
            }
            catch
            {
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
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
        /// Date : 30-12-2012
        /// Desc : Handle Cusotmer Search Popup Ok click and Fill Customer.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="args"></param>
        public void ucCustomerSearch_OkButtonPressed(object sender, EventArgs args)
        {
            try
            {
                if (ucCustomerSearch.CustomerID > 0)
                {
                    hdnCustomerId.Value = Convert.ToString(ucCustomerSearch.CustomerID);
                    BindCustomerDetails();
                    mpeCustSearchPopUp.Hide();
                }
            }
            catch
            {
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 06-01-2013
        /// Desc :
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlFixDepositeType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindFixDepositePeriods();
            }
            catch
            { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 06-01-2013
        /// Desc :
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlFDPeriodYears_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindFixDepositeMaturityDetails();
            }
            catch
            { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 07-01-2013
        /// Desc : 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void txtFixDepositeAmount_TextChanged(object sender, EventArgs e)
        {
            try
            {
                BindFixDepositeMaturityDetails();
            }
            catch
            { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 12-01-2013
        /// Desc : Close Fix Deposite
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCloseFixDeposite_Click(object sender, EventArgs e)
        {
            clsFixDeposite objFixDeposite = new clsFixDeposite();
            try
            {
                if ((!string.IsNullOrEmpty(hdnFixDepositeId.Value)) && (!string.IsNullOrEmpty(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()))))
                {
                    objFixDeposite.FixDepositeId = Convert.ToInt32(hdnFixDepositeId.Value.ToString());
                    objFixDeposite.IsClosed = true;
                    objFixDeposite.ClosedDate = String.Format("{0:dd/MM/yyyy}", DateTime.Now);
                    objFixDeposite.UpdatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString())); ;
                    objFixDeposite.UpdatedDate = Convert.ToDateTime(txtFixDepositeDate.Text);
                    objFixDeposite.IsActive = false;
                    if (objFixDeposite.CloseFixDepositeByFixDepositeId())
                    {
                        lblFixDepositeMessage.CssClass = "SuccessfulMessage";
                        lblFixDepositeMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavedSuccessfully");
                    }
                    else
                    {
                        lblFixDepositeMessage.CssClass = "FailureMessage";
                        lblFixDepositeMessage.Text = (String)GetGlobalResourceObject("SharedResource", "LoginSessionExpire");
                    }
                    ClearFDControls();
                    BindFixDepositesGrid();
                    EnableDisableFixDepositeControls(true);
                    ShowHideFixDepositeGrid(true);
                }
            }
            catch
            { }
        }
        #endregion
    }
}