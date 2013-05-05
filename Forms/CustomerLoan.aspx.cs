using System;
using System.Data;
using System.Web.UI.WebControls;
using Raigad.UserControls;
using System.Web.UI;
namespace Raigad.Forms
{
    public partial class CustomerLoan : System.Web.UI.Page
    {
        #region Gloabal Declaration
        CommonFunctions clsComFun;
        clsLoan ObjLoan;
        clsCustomer ObjCust;
        DataTable dtLoan;
        #endregion

        #region Methods




        public void BindLoanTypes()
        {
            try
            {
                CommonFunctions.BindLoanTypes(ddlLoanType);
            }
            catch (Exception)
            {

            }
            finally
            { }


        }
        /// <summary>
        ///  //Added By : Pradip pawar
        ///  Date:30-3-13
        ///  Description: Bind  Loan Type On Condition created date of customer
        ///  
        ///  Sadhe Karj:From 6 month 
        ///  prasangik:2 months
        ///  vishesh:4 months
        ///  aakasmik:1 month
        ///  
        /// </summary>
        public void BindLoanType(Int64 CustomerId)
        {

            DataTable dtLoanType;
            try
            {
                if (CustomerId > 0)
                {
                    ObjCust = new clsCustomer();
                    dtLoanType = new DataTable();
                    ObjCust.CustomerId = CustomerId;
                    dtLoanType = ObjCust.General_BindLoanTypeByCustomerId();

                    ddlLoanType.Items.Clear();
                    if (dtLoanType.Rows.Count > 0)
                    {
                        ddlLoanType.Items.Clear();
                        ddlLoanType.DataSource = null;
                        ddlLoanType.DataSource = dtLoanType;
                        ddlLoanType.DataTextField = "LoanTypeName";
                        ddlLoanType.DataValueField = "LoanTypeID";
                        ddlLoanType.DataBind();
                        ddlLoanType.Items.Insert(0, new ListItem("fuoMk", string.Empty));
                    }
                    else
                    { 
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('"+(String)GetGlobalResourceObject("SharedResource", "NewCustomerLoanNotAllowed")+"')", true);
                        lblMessage.CssClass = "FailureMessage";
                        lblMessage.Text = (String)GetGlobalResourceObject("SharedResource", "NewCustomerLoanNotAllowed");
                 
                    }
                   

                }
            }
            catch
            { }
            finally
            {
                ObjCust = new clsCustomer();
                dtLoanType = new DataTable();
            }
           
        }

        /// <summary>
        /// Private Mehod for Save Loan ApplicationRecord
        /// </summary>
        public void SaveLoanDetails()
        {
            ObjLoan = new clsLoan();
            int intYear, intMonth;
            try
            {
                //Loan Detials
                ObjLoan.LoanId = !string.IsNullOrEmpty(hdnLoanId.Value) ? Convert.ToInt32(hdnLoanId.Value) : 0;
                ObjLoan.CustomerId = !string.IsNullOrEmpty(hdnCustomerId.Value) ? Convert.ToInt32(hdnCustomerId.Value) : 0;
                ObjLoan.LoanDate = !string.IsNullOrEmpty(txtLoanDate.Text.Trim()) ? Convert.ToString(txtLoanDate.Text.Trim()) : String.Empty;
                ObjLoan.LoanTypeID = !string.IsNullOrEmpty(ddlLoanType.SelectedValue) ? Convert.ToInt32(ddlLoanType.SelectedValue) : 0;
                ObjLoan.LoanAmount = !string.IsNullOrEmpty(txtLoanAmt.Text.Trim()) ? Convert.ToDouble(txtLoanAmt.Text.Trim()) : 0;
                ObjLoan.InstallmentAmt = !string.IsNullOrEmpty(txtEmiAmt.Text.Trim()) ? Convert.ToDouble(txtEmiAmt.Text.Trim()) : 0;

                //Calculate Loan Period
                intYear = !string.IsNullOrEmpty(ddlLoanYear.SelectedValue) ? Convert.ToInt32(ddlLoanYear.SelectedValue) : 0;
                intMonth = !string.IsNullOrEmpty(ddlLoanMonth.SelectedValue) ? Convert.ToInt32(ddlLoanMonth.SelectedValue) : 0;
                intMonth = ((intYear * 12) + intMonth);
                ObjLoan.LoanPeriod = intMonth;

                ObjLoan.LoanReason = !string.IsNullOrEmpty(txtCustomerLoanPurpose.Text.Trim()) ? Convert.ToString(txtCustomerLoanPurpose.Text.Trim()) : string.Empty;
                ObjLoan.LoanPaidUpTypeID = !string.IsNullOrEmpty(ddlCustomerPastLoanEMI.SelectedValue) ? Convert.ToInt32(ddlCustomerPastLoanEMI.SelectedValue) : 0;
                ObjLoan.TotalInstallment = !string.IsNullOrEmpty(txtTotalLoanInstallmentAmt.Text.Trim()) ? Convert.ToDouble(txtTotalLoanInstallmentAmt.Text.Trim()) : 0;
                ObjLoan.WitnessNo1 = !string.IsNullOrEmpty(hdnWitnessID1.Value) ? Convert.ToInt32(hdnWitnessID1.Value) : 0;
                ObjLoan.WitnessNo2 = !string.IsNullOrEmpty(hdnWitnessID2.Value) ? Convert.ToInt32(hdnWitnessID2.Value) : 0;
                ObjLoan.WitnessNo3 = !string.IsNullOrEmpty(hdnWitnessID3.Value) ? Convert.ToInt32(hdnWitnessID3.Value) : 0;
                ObjLoan.WitnessNo4 = !string.IsNullOrEmpty(hdnWitnessID4.Value) ? Convert.ToInt32(hdnWitnessID4.Value) : 0;
                ObjLoan.CreatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                ObjLoan.CreatedDate = Convert.ToDateTime(txtLoanDate.Text);
                ObjLoan.UpdatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                ObjLoan.UpdatedDate = Convert.ToDateTime(txtLoanDate.Text);
                ObjLoan.IsActive = true;

                if (ObjLoan.Insert())
                {
                    lblMessage.CssClass = "SuccessfulMessage";
                    lblMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavedSuccessfully");
                }
                else
                {
                    lblMessage.CssClass = "FailureMessage";
                    lblMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavingFailure");
                }
                ShowHideLoanGrid(true);
                EnableDisabledControls(false);
                BindLoanGrid();
            }
            catch
            {
                lblMessage.CssClass = "FailureMessage";
                lblMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavingFailure");
            }
            finally
            {
                ObjLoan = null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="IsShow"></param>
        public void ShowHideLoanGrid(bool IsShow)
        {
            if (IsShow) { divLoanGrid.Style.Add("display", "block"); divNewLoanPopup.Style.Add("display", "none"); }
            else { divLoanGrid.Style.Add("display", "none"); divNewLoanPopup.Style.Add("display", "block"); }
        }

        /// <summary>
        /// Added by :pradip
        /// date 02-04-2013
        /// </summary>
        /// <param name="IsShow"></param>
        public void EnableDisabledControls(bool IsShow)
        {
            ddlLoanType.Enabled = IsShow;
            txtLoanAmt.Enabled = IsShow;
            txtCustomerServiceYear.Enabled = IsShow;
            txtCusotmerRetirementDate.Enabled = IsShow;
        }
        /// <summary>
        /// 
        /// </summary>
        public void BindLoanPaidUpType()
        {
            try 
	{	        
		CommonFunctions.LoanPaidUpType(ddlCustomerPastLoanEMI);
	}
	catch (Exception)
	{
	
	}finally
            {}
               
           
        }

        /// <summary>
        /// 
        /// </summary>
        private void BindLoanGrid()
        {
            ObjLoan = new clsLoan();
            dtLoan = new DataTable();
            try
            {
                if (!string.IsNullOrEmpty(txtSearchCustomer.Text) && !string.IsNullOrEmpty(ddlLoanSearch.SelectedValue))
                {
                    string strsearch = ddlLoanSearch.SelectedValue.ToString();
                    switch (strsearch)
                    {
                        case "CustomerNo":
                            ObjLoan.CustomerCode = txtSearchCustomer.Text.ToString();
                            break;
                        case "CusotmerName":
                            ObjLoan.CoustmerName = txtSearchCustomer.Text.ToString();
                            break;
                        case "CusotmerDistrict":
                            ObjLoan.DistrictName = txtSearchCustomer.Text.ToString();
                            break;
                        default:
                            break;
                    }
                }
                else
                {
                    ObjLoan.CustomerCode = string.Empty;
                    ObjLoan.CoustmerName = string.Empty;
                    ObjLoan.DistrictName = string.Empty;
                }

                dtLoan = ObjLoan.LoanWithSearchFilters();
                if (dtLoan.Rows.Count > 0)
                {
                    gvCustomerLoan.DataSource = dtLoan;
                }
                else
                {
                    gvCustomerLoan.DataSource = null;
                }

                gvCustomerLoan.PageSize = Convert.ToInt32(ddlPager.SelectedValue.ToString());
                gvCustomerLoan.DataBind();
            }
            catch { }
            finally { ObjLoan = null; ObjLoan = null; }
        }

        /// <summary>
        /// 
        /// </summary>
        public void ClearLoanControls()
        {
            try
            {
                hdnCustomerId.Value = string.Empty;
                hdnLoanId.Value = string.Empty;
                hdnWitnessID1.Value = string.Empty;
                hdnWitnessID2.Value = string.Empty;
                hdnWitnessID3.Value = string.Empty;
                hdnWitnessID4.Value = string.Empty;
                ddlLoanSearch.SelectedIndex = 0;
                txtSearchCustomer.Text = string.Empty;
                //Clear Loan Controls
                txtCustomerNo.Text = string.Empty;
                txtLoanDate.Text = DateTime.Now.ToString("yyyy/MM/dd"); ;
                ddlCustomerPrefix.SelectedIndex = 0;
                txtFirstName.Text = string.Empty;
                txtMiddleName.Text = string.Empty;
                txtLastName.Text = string.Empty;
                ddlLoanType.SelectedIndex = 0;
                txtLoanAmt.Text = string.Empty;
                txtEmiAmt.Text = string.Empty;
                ddlLoanYear.SelectedIndex = 0;
                ddlLoanMonth.SelectedIndex = 0;
                txtCustomerServiceYear.Text = string.Empty;
                txtCusotmerRetirementDate.Text = string.Empty;
                txtCustomerSalary.Text = string.Empty;
                ddlCustomerPastLoanEMI.SelectedIndex = 0;
                txtCustomerLoanPurpose.Text = string.Empty;
                //txtInterest.Text = string.Empty;
                txtTotalLoanInstallmentAmt.Text = string.Empty;
                //Clear Loan Nominee Controls
                txtCustWitnessNo1.Text = string.Empty;
                txtCustWitnessNo2.Text = string.Empty;
                txtCustWitnessNo3.Text = string.Empty;
                txtCustWitnessNo4.Text = string.Empty;
                ddlCustWitnessPrefix1.SelectedIndex = 0;
                ddlCustWitnessPrefix2.SelectedIndex = 0;
                ddlCustWitnessPrefix3.SelectedIndex = 0;
                ddlCustWitnessPrefix4.SelectedIndex = 0;
                txtCustWitnessFirstName1.Text = string.Empty;
                txtCustWitnessMiddleName1.Text = string.Empty;
                txtCustWitnessLastName1.Text = string.Empty;
                txtCustWitnessFirstName2.Text = string.Empty;
                txtCustWitnessMiddleName2.Text = string.Empty;
                txtCustWitnessLastName2.Text = string.Empty;
                txtCustWitnessFirstName3.Text = string.Empty;
                txtCustWitnessMiddleName3.Text = string.Empty;
                txtCustWitnessLastName3.Text = string.Empty;
                txtCustWitnessFirstName4.Text = string.Empty;
                txtCustWitnessMiddleName4.Text = string.Empty;
                txtCustWitnessLastName4.Text = string.Empty;

                ddlCustWitnessTaluka1.SelectedIndex = 0;
                ddlCustWitnessTaluka2.SelectedIndex = 0;
                ddlCustWitnessTaluka3.SelectedIndex = 0;
                ddlCustWitnessTaluka4.SelectedIndex = 0;
                txtCustWitnessSchool1.Text = string.Empty;
                txtCustWitnessSchool2.Text = string.Empty;
                txtCustWitnessSchool3.Text = string.Empty;
                txtCustWitnessSchool4.Text = string.Empty;
                ddlCustWitnessInstallmentReturnType1.SelectedIndex = 0;
                ddlCustWitnessInstallmentReturnType2.SelectedIndex = 0;
                ddlCustWitnessInstallmentReturnType3.SelectedIndex = 0;
                ddlCustWitnessInstallmentReturnType4.SelectedIndex = 0;
            }
            catch
            {
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 26-01-2013
        /// </summary>
        public void BindCustomerWitnessTehsils()
        {
            try
            {
                CommonFunctions.BindTahsils(ddlCustWitnessTaluka1);
                CommonFunctions.BindTahsils(ddlCustWitnessTaluka2);
                CommonFunctions.BindTahsils(ddlCustWitnessTaluka3);
                CommonFunctions.BindTahsils(ddlCustWitnessTaluka4);
            }
            catch
            { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Fill Customer Details from Cearch Search Popup
        /// </summary>
        public void BindCustomerDetails(Int64 CustomerId)
        {
            DataTable dtCustomer;
            try
            {
                if (CustomerId > 0)
                {
                    ObjCust = new clsCustomer();
                    dtCustomer = new DataTable();
                    ObjCust.CustomerId = CustomerId;
                    dtCustomer = ObjCust.General_SearcheAllCustomerWSearchFilters();
                    if (dtCustomer.Rows.Count > 0)
                    {
                        //Fill Customer Details
                        hdnCustomerId.Value = Convert.ToString(CustomerId);
                        txtCustomerNo.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["CustomerCode"].ToString()) ? dtCustomer.Rows[0]["CustomerCode"].ToString() : string.Empty;
                        ddlCustomerPrefix.SelectedIndex = ddlCustomerPrefix.Items.IndexOf(ddlCustomerPrefix.Items.FindByText(dtCustomer.Rows[0]["NamePrifix"].ToString()));
                        txtFirstName.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["FirstName"].ToString()) ? dtCustomer.Rows[0]["FirstName"].ToString() : string.Empty;
                        txtMiddleName.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["MiddleName"].ToString()) ? dtCustomer.Rows[0]["MiddleName"].ToString() : string.Empty;
                        txtLastName.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["LastName"].ToString()) ? dtCustomer.Rows[0]["LastName"].ToString() : string.Empty;
                        txtCustomerServiceYear.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["EmploymentYear"].ToString()) ? dtCustomer.Rows[0]["EmploymentYear"].ToString() : string.Empty;
                        txtCusotmerRetirementDate.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["RetirementYear"].ToString()) ? dtCustomer.Rows[0]["RetirementYear"].ToString() : string.Empty;
                        txtCustomerSalary.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["Salary"].ToString()) ? CommonFunctions.FormatMoneyString(Convert.ToDecimal(dtCustomer.Rows[0]["Salary"])) : string.Empty;

                        hdnBindLoanData.Value = string.Empty;
                    }
                }
            }
            catch
            { }
            finally
            {
                ObjCust = new clsCustomer();
                dtCustomer = new DataTable();
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Fill Customer Details from Cearch Search Popup
        /// </summary>
        public void BindWitnessDetails(Int64 CustomerId, string WitnessId)
        {
            DataTable dtCustomer;
            try
            {
                if ((CustomerId > 1) && (!string.IsNullOrEmpty(WitnessId)))
                {
                    ObjCust = new clsCustomer();
                    dtCustomer = new DataTable();
                    ObjCust.CustomerId = CustomerId;
                    dtCustomer = ObjCust.SearcheAllCustomerWSearchFilters();
                    if (dtCustomer.Rows.Count > 0)
                    {
                        //Fill Customer Details
                        switch (WitnessId)
                        {
                            case "1":
                                hdnWitnessID1.Value = Convert.ToString(CustomerId);
                                txtCustWitnessNo1.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["CustomerCode"].ToString()) ? dtCustomer.Rows[0]["CustomerCode"].ToString() : string.Empty;
                                ddlCustWitnessPrefix1.SelectedIndex = ddlCustWitnessPrefix1.Items.IndexOf(ddlCustWitnessPrefix1.Items.FindByText(dtCustomer.Rows[0]["NamePrifix"].ToString()));
                                txtCustWitnessFirstName1.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["FirstName"].ToString()) ? dtCustomer.Rows[0]["FirstName"].ToString() : string.Empty;
                                txtCustWitnessMiddleName1.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["MiddleName"].ToString()) ? dtCustomer.Rows[0]["MiddleName"].ToString() : string.Empty;
                                txtCustWitnessLastName1.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["LastName"].ToString()) ? dtCustomer.Rows[0]["LastName"].ToString() : string.Empty;
                                txtCustWitnessSchool1.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["SchoolName"].ToString()) ? dtCustomer.Rows[0]["SchoolName"].ToString() : string.Empty;
                                ddlCustWitnessTaluka1.SelectedIndex = ddlCustWitnessTaluka1.Items.IndexOf(ddlCustWitnessTaluka1.Items.FindByValue(dtCustomer.Rows[0]["TahsilId"].ToString()));
                                break;
                            case "2":
                                hdnWitnessID2.Value = Convert.ToString(CustomerId);
                                txtCustWitnessNo2.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["CustomerCode"].ToString()) ? dtCustomer.Rows[0]["CustomerCode"].ToString() : string.Empty;
                                ddlCustWitnessPrefix2.SelectedIndex = ddlCustWitnessPrefix2.Items.IndexOf(ddlCustWitnessPrefix2.Items.FindByText(dtCustomer.Rows[0]["NamePrifix"].ToString()));
                                txtCustWitnessFirstName2.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["FirstName"].ToString()) ? dtCustomer.Rows[0]["FirstName"].ToString() : string.Empty;
                                txtCustWitnessMiddleName2.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["MiddleName"].ToString()) ? dtCustomer.Rows[0]["MiddleName"].ToString() : string.Empty;
                                txtCustWitnessLastName2.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["LastName"].ToString()) ? dtCustomer.Rows[0]["LastName"].ToString() : string.Empty;
                                txtCustWitnessSchool2.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["SchoolName"].ToString()) ? dtCustomer.Rows[0]["SchoolName"].ToString() : string.Empty;
                                ddlCustWitnessTaluka2.SelectedIndex = ddlCustWitnessTaluka2.Items.IndexOf(ddlCustWitnessTaluka2.Items.FindByValue(dtCustomer.Rows[0]["TahsilId"].ToString()));
                                break;
                            case "3":
                                hdnWitnessID3.Value = Convert.ToString(CustomerId);
                                txtCustWitnessNo3.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["CustomerCode"].ToString()) ? dtCustomer.Rows[0]["CustomerCode"].ToString() : string.Empty;
                                ddlCustWitnessPrefix3.SelectedIndex = ddlCustWitnessPrefix3.Items.IndexOf(ddlCustWitnessPrefix3.Items.FindByText(dtCustomer.Rows[0]["NamePrifix"].ToString()));
                                txtCustWitnessFirstName3.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["FirstName"].ToString()) ? dtCustomer.Rows[0]["FirstName"].ToString() : string.Empty;
                                txtCustWitnessMiddleName3.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["MiddleName"].ToString()) ? dtCustomer.Rows[0]["MiddleName"].ToString() : string.Empty;
                                txtCustWitnessLastName3.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["LastName"].ToString()) ? dtCustomer.Rows[0]["LastName"].ToString() : string.Empty;
                                txtCustWitnessSchool3.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["SchoolName"].ToString()) ? dtCustomer.Rows[0]["SchoolName"].ToString() : string.Empty;
                                ddlCustWitnessTaluka3.SelectedIndex = ddlCustWitnessTaluka3.Items.IndexOf(ddlCustWitnessTaluka3.Items.FindByValue(dtCustomer.Rows[0]["TahsilId"].ToString()));
                                break;
                            case "4":
                                hdnWitnessID4.Value = Convert.ToString(CustomerId);
                                txtCustWitnessNo4.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["CustomerCode"].ToString()) ? dtCustomer.Rows[0]["CustomerCode"].ToString() : string.Empty;
                                ddlCustWitnessPrefix4.SelectedIndex = ddlCustWitnessPrefix4.Items.IndexOf(ddlCustWitnessPrefix4.Items.FindByText(dtCustomer.Rows[0]["NamePrifix"].ToString()));
                                txtCustWitnessFirstName4.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["FirstName"].ToString()) ? dtCustomer.Rows[0]["FirstName"].ToString() : string.Empty;
                                txtCustWitnessMiddleName4.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["MiddleName"].ToString()) ? dtCustomer.Rows[0]["MiddleName"].ToString() : string.Empty;
                                txtCustWitnessLastName4.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["LastName"].ToString()) ? dtCustomer.Rows[0]["LastName"].ToString() : string.Empty;
                                txtCustWitnessSchool4.Text = !string.IsNullOrEmpty(dtCustomer.Rows[0]["SchoolName"].ToString()) ? dtCustomer.Rows[0]["SchoolName"].ToString() : string.Empty;
                                ddlCustWitnessTaluka4.SelectedIndex = ddlCustWitnessTaluka4.Items.IndexOf(ddlCustWitnessTaluka4.Items.FindByValue(dtCustomer.Rows[0]["TahsilId"].ToString()));
                                break;
                        }
                        hdnBindLoanData.Value = string.Empty;
                    }
                }
            }
            catch { }
            finally
            {
                ObjCust = new clsCustomer();
                dtCustomer = new DataTable();
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 
        /// Desc :
        /// </summary>
        /// <param name="CustomerId"></param>
        /// <returns></returns>
        public bool CheckCustomerExists(Int64 CustomerId)
        {
            bool result = false;
            try
            {
                if ((!string.IsNullOrEmpty(hdnCustomerId.Value)) && (Convert.ToInt64(hdnCustomerId.Value) == CustomerId))
                {
                    result = true;
                }
                else if ((!string.IsNullOrEmpty(hdnWitnessID1.Value)) && (Convert.ToInt64(hdnWitnessID1.Value) == CustomerId))
                {
                    result = true;
                }
                else if ((!string.IsNullOrEmpty(hdnWitnessID2.Value)) && (Convert.ToInt64(hdnWitnessID2.Value) == CustomerId))
                {
                    result = true;
                }
                else if ((!string.IsNullOrEmpty(hdnWitnessID3.Value)) && (Convert.ToInt64(hdnWitnessID3.Value) == CustomerId))
                {
                    result = true;
                }
                else if ((!string.IsNullOrEmpty(hdnWitnessID4.Value)) && (Convert.ToInt64(hdnWitnessID4.Value) == CustomerId))
                {
                    result = true;
                }
                else
                {
                    result = false;
                }


              
            }
            catch
            { }
            return result;
        }
       
        
        /// <summary>
        /// Added By : Predip Pawar
        /// Date : 01-04-2013
        /// Desc : check customer is witness already for two loans
        /// </summary>
        public bool ChkWitnessExist(Int64 CustomerId)
        {
            try
            {
                return (CommonFunctions.ChkWitnessExist(CustomerId));
            }
            catch { }
            return true;
        }

        /// <summary>
        /// Added By : Predip Pawar
        /// Date : 03-04-2013
        /// Desc : Enable Desable witness 
        /// </summary>
        public void ShowHideLoanWitnessFields(bool IsShow)
        {
            //witnesss Information
            if (ddlLoanType.SelectedValue == "1")
            {               
                rfvCustWitnessNo3.Enabled = IsShow;
                rfvCustWitnessPrefix3.Enabled = IsShow;
                rfvCustWitnessNo4.Enabled = IsShow;
                rfvCustWitnessPrefix4.Enabled = IsShow;
            }
            else if (ddlLoanType.SelectedValue == "2")
            {
               
                rfvCustWitnessNo3.Enabled = IsShow;
                rfvCustWitnessPrefix3.Enabled = IsShow;
                rfvCustWitnessNo4.Enabled = IsShow;
                rfvCustWitnessPrefix4.Enabled = IsShow;
            }
            else if (ddlLoanType.SelectedValue == "4")
            {
                rfvCustWitnessNo3.Enabled = IsShow;
                rfvCustWitnessPrefix3.Enabled = IsShow;
                rfvCustWitnessNo4.Enabled = IsShow;
                rfvCustWitnessPrefix4.Enabled = IsShow;
            }
            else
            {
                rfvCustWitnessNo2.Enabled = true;
                rfvCustWitnessPrefix2.Enabled = true;
                rfvCustWitnessNo3.Enabled = true;
                rfvCustWitnessPrefix3.Enabled = true;
                rfvCustWitnessNo4.Enabled = false;
                rfvCustWitnessPrefix4.Enabled = false;
            }

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
                ucCustomerSearchLoan.OkButtonPressed +=new CustomerSearchLoan.OkButtonPressedHandler(ucCustomerSearchLoan_OkButtonPressed);
                if (!IsPostBack)
                {
                    ClearLoanControls();
                    ShowHideLoanGrid(true);
                    EnableDisabledControls(false);
                    BindCustomerWitnessTehsils();
                    BindLoanTypes();
                    BindLoanPaidUpType();
                    BindLoanGrid();
                }
                lblMessage.Text = string.Empty;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveLoanDetails();
            
        }

        /// <summary>
        /// 
        /// <
        /// /summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnClearCustomer_Click(object sender, EventArgs e)
        {
            try
            {
                ClearLoanControls();
                EnableDisabledControls(false);
                ShowHideLoanWitnessFields(false);
                BindLoanGrid();
            }
            catch
            { }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvCustomerLoan_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ObjLoan = new clsLoan();
            dtLoan = new DataTable();
            clsComFun = new CommonFunctions();
            int iLoanId;
            string strValue = string.Empty;
            int intMonth = 0, intYear = 0;
            try
            {
                //BindLoanTypes();
                iLoanId = Convert.ToInt32(((Label)gvCustomerLoan.Rows[e.NewEditIndex].FindControl("lblLoanId")).Text);
                if (iLoanId > 0)
                {
                    ObjLoan.LoanId = iLoanId;
                    dtLoan = ObjLoan.LoanWithSearchFilters();
                    if (dtLoan.Rows.Count > 0)
                    {
                        //Fill Loan Details
                        hdnCustomerId.Value = dtLoan.Rows[0]["CustomerId"].ToString();
                        hdnLoanId.Value = dtLoan.Rows[0]["LoanID"].ToString();

                        //Loan Details
                        txtLoanDate.Text = dtLoan.Rows[0]["LoanDate"].ToString();
                        ddlLoanType.SelectedValue = dtLoan.Rows[0]["LoanTypeID"].ToString();
                        txtLoanAmt.Text = CommonFunctions.FormatMoneyString(Convert.ToDecimal(dtLoan.Rows[0]["LoanAmount"]));
                        txtEmiAmt.Text = CommonFunctions.FormatMoneyString(Convert.ToDecimal(dtLoan.Rows[0]["InstallmentAmount"]));

                        strValue = dtLoan.Rows[0]["LoanPeriod"].ToString();
                        intYear = (System.Convert.ToInt32(strValue) / 12);
                        ddlLoanYear.SelectedValue = intYear.ToString();
                        intMonth = (System.Convert.ToInt32(strValue) - (intYear * 12));
                        ddlLoanMonth.SelectedValue = intMonth.ToString();

                        ddlCustomerPastLoanEMI.SelectedValue = dtLoan.Rows[0]["LoanPaidTypeID"].ToString();
                        txtCustomerLoanPurpose.Text = dtLoan.Rows[0]["LoanReason"].ToString();
                        txtTotalLoanInstallmentAmt.Text = CommonFunctions.FormatMoneyString(Convert.ToDecimal(dtLoan.Rows[0]["TotalInstallment"]));

                        BindCustomerDetails(Convert.ToInt64(dtLoan.Rows[0]["CustomerId"].ToString()));
                        BindWitnessDetails(Convert.ToInt64(dtLoan.Rows[0]["WitnessID1"]), "1");
                        BindWitnessDetails(Convert.ToInt64(dtLoan.Rows[0]["WitnessID2"]), "2");
                        BindWitnessDetails(Convert.ToInt64(dtLoan.Rows[0]["WitnessID3"]), "3");
                        BindWitnessDetails(Convert.ToInt64(dtLoan.Rows[0]["WitnessID4"]), "4");
                       
                        EnableDisabledControls(false);
                        ShowHideLoanGrid(false);
                        ShowHideLoanWitnessFields(false);
                    }
                }
            }
            catch (Exception) { }
            finally
            {
                ObjLoan = null;
                ObjCust = null;
                dtLoan = null;
            }
            ShowHideLoanGrid(false);
            EnableDisabledControls(false);
        }

        /// <summary>
        /// Added By : Himanshu Pandya 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvCustomerLoan_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvCustomerLoan.PageIndex = e.NewPageIndex;
                BindLoanGrid();
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
        protected void btnSearchCustomer_Click(object sender, EventArgs e)
        {
            try
            {
                //ClearLoanControls();
                BindLoanGrid();
            }
            catch
            { }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNewCustomer_Click(object sender, EventArgs e)
        {
            try
            {
                ClearLoanControls();
                EnableDisabledControls(true);
                ShowHideLoanWitnessFields(false);
                ShowHideLoanGrid(false);
            }
            catch { }
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
                ShowHideLoanGrid(true);
                EnableDisabledControls(true);
                BindLoanGrid();
            }
            catch
            {
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkOpenCustomerSearch_Click(object sender, EventArgs e)
        {
            hdnBindLoanData.Value = "Customer";
            mpeCustSearchPopUp.Show();
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkOpenCustomerSearchForWitness1_Click(object sender, EventArgs e)
        {
            hdnBindLoanData.Value = "Witness1";
            mpeCustSearchPopUp.Show();
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkOpenCustomerSearchForWitness2_Click(object sender, EventArgs e)
        {
            hdnBindLoanData.Value = "Witness2";
            mpeCustSearchPopUp.Show();
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkOpenCustomerSearchForWitness3_Click(object sender, EventArgs e)
        {
            hdnBindLoanData.Value = "Witness3";
            mpeCustSearchPopUp.Show();
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkOpenCustomerSearchForWitness4_Click(object sender, EventArgs e)
        {
            hdnBindLoanData.Value = "Witness4";
            mpeCustSearchPopUp.Show();
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 30-12-2012
        /// Desc : Handle Cusotmer Search Popup Ok click and Fill Customer.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="args"></param>
        public void ucCustomerSearchLoan_OkButtonPressed(object sender, EventArgs args)
        {
            try
            {
                if ((ucCustomerSearchLoan.CustomerID > 0) && (!string.IsNullOrEmpty(hdnBindLoanData.Value)))
                {
                    if (!CheckCustomerExists(ucCustomerSearchLoan.CustomerID))
                    {
                        switch (hdnBindLoanData.Value)
                        {
                            case "Customer":
                                BindCustomerDetails(ucCustomerSearchLoan.CustomerID);
                                //BindLoanType(ucCustomerSearchLoan.CustomerID);
                                break;
                            case "Witness1":
                                //if (!ChkWitnessExist(ucCustomerSearchLoan.CustomerID))
                                //{
                                    BindWitnessDetails(ucCustomerSearchLoan.CustomerID, "1");
                                //}
                                //else
                                //{
                                //    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + (String)GetGlobalResourceObject("SharedResource", "CustomerAlreadyExistsForLoan") + "');", true);
                   
                                //}
                               
                                break;
                            case "Witness2":
                                //if (!ChkWitnessExist(ucCustomerSearchLoan.CustomerID))
                                //{
                                    BindWitnessDetails(ucCustomerSearchLoan.CustomerID, "2");
                                //}
                                //else
                                //{
                                //    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + (String)GetGlobalResourceObject("SharedResource", "CustomerAlreadyExistsForLoan") + "');", true);
                   
                                //}
                               
                                break;
                            case "Witness3":
                                //if (!ChkWitnessExist(ucCustomerSearchLoan.CustomerID))
                                //{
                                    BindWitnessDetails(ucCustomerSearchLoan.CustomerID, "3");
                                //}
                                //else
                                //{
                                //    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + (String)GetGlobalResourceObject("SharedResource", "CustomerAlreadyExistsForLoan") + "');", true);
                   
                                //}
                              
                                break;
                            case "Witness4": 
                                //if (!ChkWitnessExist(ucCustomerSearchLoan.CustomerID))
                                //{
                                    BindWitnessDetails(ucCustomerSearchLoan.CustomerID, "4");
                                //}
                                //else
                                //{
                                //    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + (String)GetGlobalResourceObject("SharedResource", "CustomerAlreadyExistsForLoan") + "');", true);
                   
                                //}
                               
                                break;
                        }
                    }
                    else
                    {  //Added By : Pradip pawar
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + (String)GetGlobalResourceObject("SharedResource", "CustomerAlreadyExists") + "');", true);
                        lblMessage.CssClass = "FailureMessage";
                        lblMessage.Text = (String)GetGlobalResourceObject("SharedResource", "CustomerAlreadyExists");
                    }
                    mpeCustSearchPopUp.Hide();
                }
            }
            catch
            {
            }
        }
        
        
        /// <summary>
        /// Added By: Pradip pawar
        /// Date :03-04-2013
        /// Description: show hide witnesss according to loan type 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlLoanType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowHideLoanWitnessFields(false);
        }



      
#endregion









    }
}