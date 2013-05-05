using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Raigad.Forms
{
    public partial class CustomerAccount : System.Web.UI.Page
    {
        #region Gloabal Declaration
        clsCustomer ObjCustomer;
        clsNominees ObjNominee;
        clsAccounts ObjAccounts;
        DataTable dtCustomer;
        #endregion

        #region Methods
        /// <summary>
        /// Added By : Himanshu Pandya 
        /// </summary>
        private void ClearControls()
        {
            //Sabhasad Details
            txtCustomerNo.Text = string.Empty;
            ddlCustomernamePrefix.SelectedIndex = 0;
            ddlCustomerType.SelectedIndex = 0;
            ddlBankBranches.SelectedIndex = 0;
            txtCusotmerFirstname.Text = string.Empty;
            txtCustomerMiddlename.Text = string.Empty;
            txtCustomerLastname.Text = string.Empty;
            txtCusotomerAddress.Text = string.Empty;
            ddlCustomerVillage.Text = string.Empty;
            //ddlCustomerVillage.SelectedIndex = 0;
            ddlCustomerTaluka.SelectedIndex = 0;
            ddlCustomerDistrict.SelectedIndex = 0;
            txtCustomerPinCode.Text = string.Empty;
            txtCustomerPhoneNumber.Text = string.Empty;
            txtCustomerDOB.Text = string.Empty;
            txtCustomerEmail.Text = string.Empty;
            txtCustomerPanCard.Text = string.Empty;
            //txtCustTotalYearOfService.Text = string.Empty;
            txtCustEmploymentYear.Text = string.Empty;
            //txtCustomerYear.Text = string.Empty;
            txtCustomerSalary.Text = string.Empty;
            txtCustRetirementDate.Text = string.Empty;

            //Sabhasad School Details
            txtCustomerSchoolname.Text = string.Empty;
            ddlCustomerSchoolTaluka.SelectedIndex = 0;
            ddlCusotmerSchoolDistrict.SelectedIndex = 0;
            txtCustomerSchoolPinCode.Text = string.Empty;

            //Sabhasad Nominee Details
            ddlCustNomineePrefix.SelectedIndex = 0;
            txtCustnomineeFirstname.Text = string.Empty;
            txtCustnomineeMiddlename.Text = string.Empty;
            txtCustnomineeLastname.Text = string.Empty;
            txtCustNomineeAddress.Text = string.Empty;
            ddlCustNomineeVillage.Text = string.Empty;
            ddlCustNomineeTaluka.SelectedIndex = 0;
            ddlCustNomineeDistrict.SelectedIndex = 0;
            txtCustNomineePinCode.Text = string.Empty;
            txtCustNomineePhonenumber.Text = string.Empty;
            txtCustNomineeOccupation.Text = string.Empty;
            txtCustRelationWithNominee.Text = string.Empty;

            //Sabhasad Account Details
            txtCustomerAccNumber.Text = string.Empty;
            txtCustomerAccOpenDate.Text = DateTime.Now.ToString("yyyy/MM/dd");
            txtCustomerOpeningBalance.Text = string.Empty;
            txtCustomerShareAmt.Text = string.Empty;
            //ddlCustomerAccType.SelectedIndex = 0;
            //txtCustomerKayamnidhiBal.Text = string.Empty;
            //txtCustomerAccountBal.Text = string.Empty;

            txtCustomerAccNumber.Enabled = true;
            txtCustomerAccOpenDate.Enabled = true;
            txtCustomerOpeningBalance.Enabled = true;
            txtCustomerShareAmt.Enabled = true;
            ddlCustomerType.Enabled = true;
        }

        /// <summary>
        /// Added By : Himanshu Pandya 
        /// </summary>
        /// <param name="IsShow"></param>
        private void ShowHideCusotmerGrid(bool IsShow)
        {
            if (IsShow) { divCustomerGrid.Style.Add("display", "block"); divNewCusotmerPopup.Style.Add("display", "none"); }
            else { divCustomerGrid.Style.Add("display", "none"); divNewCusotmerPopup.Style.Add("display", "block"); }
        }

        /// <summary>
        /// Added By : Himanshu Pandya 
        /// </summary>
        /// <param name="IsShow"></param>
        private void ShowHideCustomerTypeFields(bool IsShow)
        {
            //Custmer School Information
            rfvCustomerSchoolname.Enabled = IsShow;
            rfvCustomerSchoolTaluka.Enabled = IsShow;
            rfvCustomerSchoolDistrict.Enabled = IsShow;
            //rfvSchoolPinCode.Enabled = IsShow;
            divCustomerSchoolDetails.Visible = IsShow;

            //Custmer Account Information
            rfvCustomerAccNumber.Enabled = IsShow;
            rfvCustomerOpeningBalance.Enabled = IsShow;
            revCustomerOpeningBalance.Enabled = IsShow;
            rfvCustomerShareAmt.Enabled = IsShow;
            revCustomerShareAmt.Enabled = IsShow;
            divCustomerAccountDetails.Visible = IsShow;
            
        }

        /// <summary>
        /// Added By : Himanshu Pandya 
        /// </summary>
        private void BindVillages()
        {
            try
            {
                //CommonFunctions.BindVillages(ddlCustomerVillage);
                //CommonFunctions.BindVillages(ddlCustNomineeVillage);
            }
            catch { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya 
        /// </summary>
        private void BindTahsils()
        {
            try
            {
                 CommonFunctions.BindTahsils(ddlCustomerTaluka);
                CommonFunctions.BindTahsils(ddlCustNomineeTaluka);
                CommonFunctions.BindTahsilsSchool(ddlCustomerSchoolTaluka);//district id 26
            }
            catch { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya 
        /// </summary>
        private void BindDistricts()
        {
            try
            {
                CommonFunctions.BindDistricts(ddlCustomerDistrict);         
                CommonFunctions.BindDistricts(ddlCustNomineeDistrict);
                CommonFunctions.BindDistrictsSchool(ddlCusotmerSchoolDistrict);//district id 26
            }
            catch { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya 
        /// </summary>
        private void BindBankBranches()
        {
            try
            {
                CommonFunctions.BindBankBranches(ddlBankBranches);
            }
            catch { }
        }

        /// <summary>
        /// 
        /// </summary>
        private void BindCustomerTypes()
        {
            try
            {
                CommonFunctions.BindCustomerTypes(ddlCustomerType);
            }
            catch { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya  
        /// </summary>
        private void BindCustomerGrid()
        {
            ObjCustomer = new clsCustomer();
            dtCustomer = new DataTable();
            try
            {
                ShowHideCusotmerGrid(true);

                if (!string.IsNullOrEmpty(txtSearchCustomer.Text) && !string.IsNullOrEmpty(ddlCustomerSearch.SelectedValue))
                {
                    string strsearch = ddlCustomerSearch.SelectedValue.ToString();
                    switch (strsearch)
                    {
                        case "CustomerNo":
                            ObjCustomer.CustomerCode = txtSearchCustomer.Text.ToString();
                            break;
                        case "CusotmerName":
                            ObjCustomer.FirstName = txtSearchCustomer.Text.ToString();
                            break;
                        case "CusotmerDistrict":
                            ObjCustomer.DistrictName = txtSearchCustomer.Text.ToString();
                            break;
                        default:
                            break;
                    }
                }
                else
                {
                    ObjCustomer.CustomerCode = string.Empty;
                    ObjCustomer.FirstName = string.Empty;
                    ObjCustomer.DistrictName = string.Empty;
                }

                dtCustomer = ObjCustomer.SearcheAllCustomerWSearchFilters();
                if (dtCustomer.Rows.Count > 0)
                {
                    gvCustomer.DataSource = dtCustomer;
                }
                else
                {
                    gvCustomer.DataSource = null;
                }

                gvCustomer.PageSize = Convert.ToInt32(ddlPager.SelectedValue.ToString());
                gvCustomer.DataBind();
            }
            catch { }
            finally { ObjCustomer = null; dtCustomer = null; }
        }

        #endregion

        #region Events

        /// <summary>
        /// Added By : Himanshu Pandya 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindVillages();
                    BindTahsils();
                    BindDistricts();
                    BindBankBranches();
                    BindCustomerTypes();
                    BindCustomerGrid();
                    ShowHideCustomerTypeFields(true);                    
                }
                lblMessage.Text = string.Empty;
            }
            catch { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearchCustomer_Click(object sender, EventArgs e)
        {
            BindCustomerGrid();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnClearCustomer_Click(object sender, EventArgs e)
        {
            ddlCustomerSearch.SelectedIndex = 0;
            txtSearchCustomer.Text = string.Empty;
            BindCustomerGrid();
            BindTahsils();//added by : pradip 
        }

        /// <summary>
        /// Added By : Himanshu Pandya  
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNewCustomer_Click(object sender, EventArgs e)
        {
            try
            {
                BindTahsils();//added by : pradip 
                ClearControls();
                hdnCusotmerId.Value = string.Empty;
                hdnNomineeId.Value = string.Empty;
                hdnAccountId.Value = string.Empty;
                ShowHideCusotmerGrid(false);
                ShowHideCustomerTypeFields(true);
            }
            catch { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSaveCustomer_Click(object sender, EventArgs e)
        {
            ObjCustomer = new clsCustomer();
            ObjNominee = new clsNominees();
            ObjAccounts = new clsAccounts();
            try
            {
                if (!string.IsNullOrEmpty(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString())))
                {
                    //Customer Detials
                    ObjCustomer.CustomerId = !string.IsNullOrEmpty(hdnCusotmerId.Value) ? Convert.ToInt32(hdnCusotmerId.Value.ToString()) : 0;
                    //ObjCustomer.CustomerCode = (!string.IsNullOrEmpty(ddlCustomerCodePrefix.SelectedValue) ? ddlCustomerCodePrefix.SelectedValue.ToString() : string.Empty) + "-" + (!string.IsNullOrEmpty(txtCustomerNo.Text) ? txtCustomerNo.Text : string.Empty);
                    ObjCustomer.CustomerCode = !string.IsNullOrEmpty(txtCustomerNo.Text) ? txtCustomerNo.Text : string.Empty;
                    ObjCustomer.CustomerTypeId = !string.IsNullOrEmpty(ddlCustomerType.SelectedValue) ? Convert.ToInt32(ddlCustomerType.SelectedValue.ToString()) : 0;
                    ObjCustomer.BankBranchId = !string.IsNullOrEmpty(ddlBankBranches.SelectedValue) ? Convert.ToInt32(ddlBankBranches.SelectedValue.ToString()) : 0;
                    ObjCustomer.NamePrifix = !string.IsNullOrEmpty(ddlCustomernamePrefix.SelectedValue) ? ddlCustomernamePrefix.SelectedValue.ToString() : string.Empty;
                    ObjCustomer.FirstName = !string.IsNullOrEmpty(txtCusotmerFirstname.Text) ? txtCusotmerFirstname.Text : string.Empty;
                    ObjCustomer.MiddleName = !string.IsNullOrEmpty(txtCustomerMiddlename.Text) ? txtCustomerMiddlename.Text : string.Empty;
                    ObjCustomer.LastName = !string.IsNullOrEmpty(txtCustomerLastname.Text) ? txtCustomerLastname.Text : string.Empty;
                    ObjCustomer.Address1 = !string.IsNullOrEmpty(txtCusotomerAddress.Text) ? txtCusotomerAddress.Text : string.Empty;
                    ObjCustomer.VillageId = !string.IsNullOrEmpty(ddlCustomerVillage.Text) ? ddlCustomerVillage.Text : string.Empty;
                 
                    //ObjCustomer.VillageId = !string.IsNullOrEmpty(ddlCustomerVillage.SelectedValue) ? Convert.ToInt32(ddlCustomerVillage.SelectedValue.ToString()) : 0;
                    ObjCustomer.TahsilId = !string.IsNullOrEmpty(ddlCustomerTaluka.SelectedValue) ? Convert.ToInt32(ddlCustomerTaluka.SelectedValue.ToString()) : 0;
                    ObjCustomer.DistrictId = !string.IsNullOrEmpty(ddlCustomerDistrict.SelectedValue) ? Convert.ToInt32(ddlCustomerDistrict.SelectedValue.ToString()) : 0;
                    ObjCustomer.Pincode = !string.IsNullOrEmpty(txtCustomerPinCode.Text) ? txtCustomerPinCode.Text.ToString() : string.Empty;
                    ObjCustomer.PhoneNumber = !string.IsNullOrEmpty(txtCustomerPhoneNumber.Text) ? txtCustomerPhoneNumber.Text.ToString() : "";
                    ObjCustomer.DateOfBirth = !string.IsNullOrEmpty(txtCustomerDOB.Text) ? txtCustomerDOB.Text.ToString() : string.Empty;
                    ObjCustomer.Email = !string.IsNullOrEmpty(txtCustomerEmail.Text) ? txtCustomerEmail.Text.ToString() : string.Empty;
                    ObjCustomer.SchoolName = !string.IsNullOrEmpty(txtCustomerSchoolname.Text) ? txtCustomerSchoolname.Text.ToString() : string.Empty;
                    ObjCustomer.SchoolTahsilId = !string.IsNullOrEmpty(ddlCustomerSchoolTaluka.SelectedValue) ? Convert.ToInt32(ddlCustomerSchoolTaluka.SelectedValue.ToString()) : 0;
                    ObjCustomer.SchoolDistrictId = !string.IsNullOrEmpty(ddlCusotmerSchoolDistrict.SelectedValue) ? Convert.ToInt32(ddlCusotmerSchoolDistrict.SelectedValue.ToString()) : 0;
                    ObjCustomer.SchoolPinCode = !string.IsNullOrEmpty(txtCustomerSchoolPinCode.Text) ? txtCustomerSchoolPinCode.Text.ToString() : string.Empty;

                    ObjCustomer.CustomerPanCard = !string.IsNullOrEmpty(txtCustomerPanCard.Text) ? txtCustomerPanCard.Text.ToString() : string.Empty;
                    //ObjCustomer.TotalYearOfService = !string.IsNullOrEmpty(txtCustTotalYearOfService.Text) ? txtCustTotalYearOfService.Text.ToString() : string.Empty;
                    ObjCustomer.EmploymentYear = !string.IsNullOrEmpty(txtCustEmploymentYear.Text) ? txtCustEmploymentYear.Text.ToString() : string.Empty;
                    //ObjCustomer.CustomerYear = !string.IsNullOrEmpty(txtCustomerYear.Text) ? txtCustomerYear.Text.ToString() : string.Empty;
                    ObjCustomer.Salary = !string.IsNullOrEmpty(txtCustomerSalary.Text) ? Convert.ToDecimal(txtCustomerSalary.Text.ToString()) : 0;
                    ObjCustomer.RetirementYear = !string.IsNullOrEmpty(txtCustRetirementDate.Text) ? txtCustRetirementDate.Text.ToString() : string.Empty;

                    ObjCustomer.CreatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                    ObjCustomer.CreatedDate = Convert.ToDateTime(txtCustomerAccOpenDate.Text);
                    ObjCustomer.UpdatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                    ObjCustomer.UpdatedDate = Convert.ToDateTime(txtCustomerAccOpenDate.Text);
                    ObjCustomer.IsActive = true;

                    if (ObjCustomer.Insert())
                    {
                        //Customer Nominee Details
                        ObjNominee.NomineeId = !string.IsNullOrEmpty(hdnNomineeId.Value) ? Convert.ToInt32(hdnNomineeId.Value.ToString()) : 0;
                        ObjNominee.NomineeReferenceId = ObjCustomer.CustomerId > 0 ? ObjCustomer.CustomerId : 0;
                        ObjNominee.NomineeTypeId = Convert.ToInt32(clsEnum.NomineeType.Customer.GetHashCode().ToString());
                        ObjNominee.NamePrefix = !string.IsNullOrEmpty(ddlCustNomineePrefix.SelectedValue) ? ddlCustNomineePrefix.SelectedValue.ToString() : string.Empty;
                        ObjNominee.FirstName = !string.IsNullOrEmpty(txtCustnomineeFirstname.Text) ? txtCustnomineeFirstname.Text.ToString() : string.Empty;
                        ObjNominee.MiddleName = !string.IsNullOrEmpty(txtCustnomineeMiddlename.Text) ? txtCustnomineeMiddlename.Text.ToString() : string.Empty;
                        ObjNominee.LastName = !string.IsNullOrEmpty(txtCustnomineeLastname.Text) ? txtCustnomineeLastname.Text.ToString() : string.Empty;
                        ObjNominee.Address = !string.IsNullOrEmpty(txtCustNomineeAddress.Text) ? txtCustNomineeAddress.Text.ToString() : string.Empty;
                        ObjNominee.RelationWith = !string.IsNullOrEmpty(txtCustRelationWithNominee.Text) ? txtCustRelationWithNominee.Text.ToString() : string.Empty;
                        ObjNominee.VillageId = !string.IsNullOrEmpty(ddlCustNomineeVillage.Text) ? ddlCustNomineeVillage.Text.ToString() : string.Empty;
                        ObjNominee.TahsilId = !string.IsNullOrEmpty(ddlCustNomineeTaluka.SelectedValue) ? Convert.ToInt32(ddlCustNomineeTaluka.SelectedValue.ToString()) : 0;
                        ObjNominee.DistrictId = !string.IsNullOrEmpty(ddlCustNomineeDistrict.SelectedValue) ? Convert.ToInt32(ddlCustNomineeDistrict.SelectedValue.ToString()) : 0;
                        ObjNominee.PinCode = !string.IsNullOrEmpty(txtCustNomineePinCode.Text) ? txtCustNomineePinCode.Text.ToString() : string.Empty;
                        ObjNominee.PhoneNumber = !string.IsNullOrEmpty(txtCustNomineePhonenumber.Text) ? txtCustNomineePhonenumber.Text.ToString() : string.Empty;
                        ObjNominee.Occupation = !string.IsNullOrEmpty(txtCustNomineeOccupation.Text) ? txtCustNomineeOccupation.Text.ToString() : string.Empty;
                        ObjNominee.CreatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                        ObjNominee.CreatedDate = Convert.ToDateTime(txtCustomerAccOpenDate.Text);
                        ObjNominee.UpdatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                        ObjNominee.UpdatedDate = Convert.ToDateTime(txtCustomerAccOpenDate.Text);
                        ObjNominee.IsActive = true;
                        ObjNominee.Insert();

                        if (!ddlCustomerType.SelectedValue.ToString().Equals(clsEnum.CustomerType.NaamMatra.GetHashCode().ToString()))
                        {
                            //Account Details
                            ObjAccounts.AccountId = !string.IsNullOrEmpty(hdnAccountId.Value) ? Convert.ToInt32(hdnAccountId.Value.ToString()) : 0;
                            ObjAccounts.AccountNumber = !string.IsNullOrEmpty(txtCustomerAccNumber.Text) ? txtCustomerAccNumber.Text.ToString() : string.Empty;
                            ObjAccounts.CustomerId = ObjCustomer.CustomerId > 0 ? ObjCustomer.CustomerId : 0;
                            ObjAccounts.OpeningDate = !string.IsNullOrEmpty(txtCustomerAccOpenDate.Text) ? txtCustomerAccOpenDate.Text.ToString() : string.Empty;
                            //ObjAccounts.AccountTypeId = !string.IsNullOrEmpty(ddlCustomerAccType.SelectedValue) ? Convert.ToInt32(ddlCustomerAccType.SelectedValue.ToString()) : 0;
                            ObjAccounts.AccountTypeId = Convert.ToInt32(clsEnum.AccountTypes.SavingAccount.GetHashCode().ToString());
                            ObjAccounts.OpeningBalance = !string.IsNullOrEmpty(txtCustomerOpeningBalance.Text) ? Convert.ToDecimal(txtCustomerOpeningBalance.Text.ToString()) : 0;
                            ObjAccounts.ShareBalance = !string.IsNullOrEmpty(txtCustomerShareAmt.Text) ? Convert.ToDecimal(txtCustomerShareAmt.Text.ToString()) : 0;
                            //ObjAccounts.KayamNidhiBalance = !string.IsNullOrEmpty(txtCustomerKayamnidhiBal.Text) ? Convert.ToDecimal(txtCustomerKayamnidhiBal.Text.ToString()) : 0;
                            //ObjAccounts.AccountBalance = !string.IsNullOrEmpty(txtCustomerAccountBal.Text) ? Convert.ToDecimal(txtCustomerAccountBal.Text.ToString()) : 0;
                            ObjAccounts.KayamNidhiBalance = 0;
                            ObjAccounts.AccountBalance = !string.IsNullOrEmpty(txtCustomerOpeningBalance.Text) ? Convert.ToDecimal(txtCustomerOpeningBalance.Text.ToString()) : 0;
                            ObjAccounts.CreatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                            ObjAccounts.CreatedDate = Convert.ToDateTime(txtCustomerAccOpenDate.Text);
                            ObjAccounts.UpdatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                            ObjAccounts.UpdatedDate = Convert.ToDateTime(txtCustomerAccOpenDate.Text);
                            ObjAccounts.IsActive = true;
                            ObjAccounts.Insert();
                        }
                        else
                        {
                            //Account Details
                            ObjAccounts.AccountId = !string.IsNullOrEmpty(hdnAccountId.Value) ? Convert.ToInt32(hdnAccountId.Value.ToString()) : 0;
                            ObjAccounts.AccountNumber = string.Empty;
                            ObjAccounts.CustomerId = ObjCustomer.CustomerId > 0 ? ObjCustomer.CustomerId : 0;
                            ObjAccounts.OpeningDate = txtCustomerAccOpenDate.Text;
                            ObjAccounts.AccountTypeId = Convert.ToInt32(clsEnum.AccountTypes.SavingAccount.GetHashCode().ToString());
                            ObjAccounts.OpeningBalance = 0;
                            ObjAccounts.ShareBalance = 0;
                            ObjAccounts.KayamNidhiBalance = 0;
                            ObjAccounts.AccountBalance = 0;
                            ObjAccounts.CreatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                            ObjAccounts.CreatedDate = Convert.ToDateTime(txtCustomerAccOpenDate.Text);
                            ObjAccounts.UpdatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                            ObjAccounts.UpdatedDate = Convert.ToDateTime(txtCustomerAccOpenDate.Text);
                            ObjAccounts.IsActive = true;
                            ObjAccounts.Insert();
                        }

                        lblMessage.CssClass = "SuccessfulMessage";
                        lblMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavedSuccessfully");
                    }
                }
                else
                {
                    lblMessage.CssClass = "FailureMessage";
                    lblMessage.Text = (String)GetGlobalResourceObject("SharedResource", "LoginSessionExpire");
                }
                BindCustomerGrid();
            }
            catch
            {
                lblMessage.CssClass = "FailureMessage";
                lblMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavingFailure");
            }
            finally
            {
                ObjCustomer = null;
                ObjNominee = null;
                ObjAccounts = null;
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelSaveCusotmer_Click(object sender, EventArgs e)
        {
            try
            {
                BindTahsils();//added by : pradip 
                ClearControls();
                ShowHideCusotmerGrid(true);
            }
            catch { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 08-12-2012
        /// Desc : Check Customer Code Exists or not
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void txtCustomerNo_TextChanged(object sender, EventArgs e)
        {
            try
            {
                TextBox txtCustNo = (TextBox)sender;
                if (!string.IsNullOrEmpty(txtCustNo.Text))
                {
                    if (clsCustomer.CheckeCustomerCode(txtCustNo.Text))
                    {
                        txtCustNo.Text = string.Empty;
                        lblMessage.Text = "Customer code already exists";
                        lblMessage.CssClass = "FailureMessage";
                    }
                    else
                    {
                        lblMessage.Text = string.Empty;
                    }
                }
            }
            catch
            {
            }
            finally
            {
            }
        }

        /// <summary>
        /// Created By : Himanshu Pandya
        /// Created Date : 04-11-2012
        /// Desc : Bind Customer grid with Paging.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlPager_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCustomerGrid();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlCustomerType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlCustomerType.SelectedValue.ToString().Equals(clsEnum.CustomerType.Sadharan.GetHashCode().ToString()))
                {
                    ShowHideCustomerTypeFields(true);
                }
                else if (ddlCustomerType.SelectedValue.ToString().Equals(clsEnum.CustomerType.NaamMatra.GetHashCode().ToString()))
                {
                    ShowHideCustomerTypeFields(false);
                }
                else
                {
                    ShowHideCustomerTypeFields(true);
                }

            }
            catch
            { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya  
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvCustomer_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ObjCustomer = new clsCustomer();
            dtCustomer = new DataTable();
            int iCustomerId;
            try
            {
                iCustomerId = Convert.ToInt32(((Label)gvCustomer.Rows[e.NewEditIndex].FindControl("lblCustomerId")).Text);
                if (iCustomerId > 0)
                {
                    ObjCustomer.CustomerCode = string.Empty;
                    ObjCustomer.FirstName = string.Empty;
                    ObjCustomer.DistrictName = string.Empty;
                    ObjCustomer.CustomerId = iCustomerId;
                    dtCustomer = ObjCustomer.SearcheAllCustomerWSearchFilters();
                    if (dtCustomer.Rows.Count > 0)
                    {
                        //Fill Cusotmer Details
                        hdnCusotmerId.Value = dtCustomer.Rows[0]["CustomerId"].ToString();
                        //ddlCustomerCodePrefix.SelectedIndex = ddlCustomerCodePrefix.Items.IndexOf(ddlCustomerCodePrefix.Items.FindByValue(dtCustomer.Rows[0]["CustomerCode"].ToString().Substring(0, 3)));
                        //txtCustomerNo.Text = dtCustomer.Rows[0]["CustomerCode"].ToString().Substring(4, (Convert.ToInt32(dtCustomer.Rows[0]["CustomerCode"].ToString().Length) - 4));
                        txtCustomerNo.Text = dtCustomer.Rows[0]["CustomerCode"].ToString();
                        ddlCustomerType.SelectedIndex = ddlCustomerType.Items.IndexOf(ddlCustomerType.Items.FindByValue(dtCustomer.Rows[0]["CustomerTypeId"].ToString().Trim()));

                        if (ddlCustomerType.SelectedValue.ToString().Equals(clsEnum.CustomerType.Sadharan.GetHashCode().ToString()))
                        {
                            ShowHideCustomerTypeFields(true);
                        }
                        else if (ddlCustomerType.SelectedValue.ToString().Equals(clsEnum.CustomerType.NaamMatra.GetHashCode().ToString()))
                        {
                            ShowHideCustomerTypeFields(false);
                        }
                        else
                        {
                            ShowHideCustomerTypeFields(true);
                        }

                        ddlCustomernamePrefix.SelectedIndex = ddlCustomernamePrefix.Items.IndexOf(ddlCustomernamePrefix.Items.FindByValue(dtCustomer.Rows[0]["NamePrifix"].ToString().Trim()));
                        ddlBankBranches.SelectedIndex = ddlBankBranches.Items.IndexOf(ddlBankBranches.Items.FindByValue(dtCustomer.Rows[0]["BankBranchId"].ToString().Trim()));
                        txtCusotmerFirstname.Text = dtCustomer.Rows[0]["FirstName"].ToString().Trim();
                        txtCustomerMiddlename.Text = dtCustomer.Rows[0]["MiddleName"].ToString().Trim();
                        txtCustomerLastname.Text = dtCustomer.Rows[0]["LastName"].ToString().Trim();
                        txtCusotomerAddress.Text = dtCustomer.Rows[0]["Address1"].ToString().Trim();
                        ddlCustomerVillage.Text = dtCustomer.Rows[0]["VillageId"].ToString().Trim();

                        //ddlCustomerVillage.SelectedIndex = ddlCustomerVillage.Items.IndexOf(ddlCustomerVillage.Items.FindByValue(dtCustomer.Rows[0]["VillageId"].ToString().Trim()));
                        ddlCustomerTaluka.SelectedIndex = ddlCustomerTaluka.Items.IndexOf(ddlCustomerTaluka.Items.FindByValue(dtCustomer.Rows[0]["TahsilId"].ToString().Trim()));
                        ddlCustomerDistrict.SelectedIndex = ddlCustomerDistrict.Items.IndexOf(ddlCustomerDistrict.Items.FindByValue(dtCustomer.Rows[0]["DistrictId"].ToString().Trim()));
                        txtCustomerPinCode.Text = dtCustomer.Rows[0]["Pincode"].ToString().Trim();
                        txtCustomerPhoneNumber.Text = dtCustomer.Rows[0]["PhoneNumber"].ToString().Trim();
                        txtCustomerDOB.Text = dtCustomer.Rows[0]["DateOfBirth"].ToString();
                        txtCustomerEmail.Text = dtCustomer.Rows[0]["Email"].ToString();
                        txtCustomerSchoolname.Text = dtCustomer.Rows[0]["SchoolName"].ToString();
                        ddlCustomerSchoolTaluka.SelectedIndex = ddlCustomerSchoolTaluka.Items.IndexOf(ddlCustomerSchoolTaluka.Items.FindByValue(dtCustomer.Rows[0]["SchoolTahsilId"].ToString()));
                        ddlCusotmerSchoolDistrict.SelectedIndex = ddlCusotmerSchoolDistrict.Items.IndexOf(ddlCusotmerSchoolDistrict.Items.FindByValue(dtCustomer.Rows[0]["SchoolDistrictId"].ToString()));
                        txtCustomerSchoolPinCode.Text = dtCustomer.Rows[0]["SchoolPinCode"].ToString().Trim();
                        txtCustomerPanCard.Text = dtCustomer.Rows[0]["CustomerPanCard"].ToString().Trim();
                        //txtCustTotalYearOfService.Text = dtCustomer.Rows[0]["TotalYearOfService"].ToString().Trim();
                        txtCustEmploymentYear.Text = dtCustomer.Rows[0]["EmploymentYear"].ToString().Trim();
                        //txtCustomerYear.Text = dtCustomer.Rows[0]["CustomerYear"].ToString().Trim();
                        if (!string.IsNullOrEmpty(dtCustomer.Rows[0]["Salary"].ToString()))
                        {
                            txtCustomerSalary.Text = CommonFunctions.FormatMoneyString(Convert.ToDecimal(dtCustomer.Rows[0]["Salary"]));
                        }
                        txtCustRetirementDate.Text = dtCustomer.Rows[0]["RetirementYear"].ToString().Trim();

                        //Fill Nominee Details
                        hdnNomineeId.Value = dtCustomer.Rows[0]["NomineeId"].ToString().Trim();
                        ddlCustNomineePrefix.SelectedIndex = ddlCustNomineePrefix.Items.IndexOf(ddlCustNomineePrefix.Items.FindByValue(dtCustomer.Rows[0]["NomineeNamePrefix"].ToString().Trim()));
                        txtCustnomineeFirstname.Text = dtCustomer.Rows[0]["NomineeFirstName"].ToString().Trim();
                        txtCustnomineeMiddlename.Text = dtCustomer.Rows[0]["NomineeMiddleName"].ToString().Trim();
                        txtCustnomineeLastname.Text = dtCustomer.Rows[0]["NomineeLastName"].ToString().Trim();
                        txtCustNomineeAddress.Text = dtCustomer.Rows[0]["NomineeAddress"].ToString().Trim();
                        ddlCustNomineeVillage.Text =dtCustomer.Rows[0]["NomineeVillageId"].ToString().Trim();
                        ddlCustNomineeTaluka.SelectedIndex = ddlCustNomineeTaluka.Items.IndexOf(ddlCustNomineeTaluka.Items.FindByValue(dtCustomer.Rows[0]["NomineeTahsilId"].ToString().Trim()));
                        ddlCustNomineeDistrict.SelectedIndex = ddlCustNomineeDistrict.Items.IndexOf(ddlCustNomineeDistrict.Items.FindByValue(dtCustomer.Rows[0]["NomineeDistrictId"].ToString().Trim()));
                        txtCustNomineePinCode.Text = dtCustomer.Rows[0]["NomineePinCode"].ToString().Trim();
                        txtCustNomineePhonenumber.Text = dtCustomer.Rows[0]["NomineePhoneNumber"].ToString().Trim();
                        txtCustNomineeOccupation.Text = dtCustomer.Rows[0]["NomineeOccupation"].ToString().Trim();
                        txtCustRelationWithNominee.Text = dtCustomer.Rows[0]["NomineeRelationWith"].ToString().Trim();

                        hdnAccountId.Value = dtCustomer.Rows[0]["AccountId"].ToString().Trim();
                        txtCustomerAccNumber.Text = dtCustomer.Rows[0]["AccountNumber"].ToString().Trim();
                        txtCustomerAccOpenDate.Text = dtCustomer.Rows[0]["OpeningDate"].ToString().Trim();
                        txtCustomerOpeningBalance.Text = CommonFunctions.FormatMoneyString(Convert.ToDecimal(dtCustomer.Rows[0]["OpeningBalance"]));
                        txtCustomerShareAmt.Text = CommonFunctions.FormatMoneyString(Convert.ToDecimal(dtCustomer.Rows[0]["ShareBalance"]));
                        //ddlCustomerAccType.SelectedIndex = ddlCustomerAccType.Items.IndexOf(ddlCustomerAccType.Items.FindByValue(dtCustomer.Rows[0]["AccountTypeId"].ToString().Trim()));
                        //txtCustomerKayamnidhiBal.Text = CommonFunctions.FormatMoneyString(Convert.ToDecimal(dtCustomer.Rows[0]["KayamNidhiBalance"]));
                        //txtCustomerAccountBal.Text = CommonFunctions.FormatMoneyString(Convert.ToDecimal(dtCustomer.Rows[0]["AccountBalance"]));
                        
                        
                        /*teprary validation false
                         * 
                         * txtCustomerAccNumber.Enabled = false;
                        txtCustomerAccOpenDate.Enabled = false;
                        txtCustomerOpeningBalance.Enabled = false;
                        txtCustomerShareAmt.Enabled = false;
                        ddlCustomerType.Enabled = false; 
                        */
                        ShowHideCusotmerGrid(false);
                    }
                }
            }
            catch (Exception) { }
            finally { ObjCustomer = null; dtCustomer = null; }

            ShowHideCusotmerGrid(false);
        }

        /// <summary>
        /// Added By : Himanshu Pandya 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvCustomer_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvCustomer.PageIndex = e.NewPageIndex;
                BindCustomerGrid();
            }
            catch
            {
            }
        }
        #endregion
        /// <summary>
        /// Added By :pradip pawar
        /// date :15-04-2013
        /// Desc : bind tahsil from district id
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlCustomerDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(ddlCustomerDistrict.SelectedValue.ToString()))
                {
                    BindTahsils(ddlCustomerDistrict.SelectedValue.ToString(),"Customer");
                }
            }
            catch (Exception)
            {
                
              
            }
    
        }

        private void BindTahsils(string DistrictId,string ddlType)
        {
            if (ddlType.Equals("Customer"))
            {
                CommonFunctions.BindTahsils(ddlCustomerTaluka,DistrictId);
            }
            else if (ddlType.Equals("CustomerNominee"))
            {
                CommonFunctions.BindTahsils(ddlCustNomineeTaluka, DistrictId);
            }
            
        }

        protected void ddlCustNomineeDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(ddlCustNomineeDistrict.SelectedValue.ToString()))
                {
                    BindTahsils(ddlCustNomineeDistrict.SelectedValue.ToString(), "CustomerNominee");
                }
            }
            catch (Exception)
            {


            }
    
        }
    }
}