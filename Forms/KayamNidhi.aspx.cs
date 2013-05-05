using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;

namespace Raigad.Forms
{
    public partial class KayamNidhi : System.Web.UI.Page
    {
        #region Global Declarion
        clsCustomerKayamNidhi ObjCustomerKayamNidhi;
        DataTable dtCustomerKayamNidhi;
        #endregion

        #region Methods

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 15-03-2013
        /// Desc : Bind KayamNidhi Perionds
        /// </summary>
        public void BindKayamNidhiPeriods()
        {
            try
            {
                //Bind Years
                for (int iCounter = 1990; iCounter <= DateTime.Now.Year; iCounter++)
                {
                    ddlKayamNidhiYear.Items.Add(new ListItem(iCounter.ToString(), iCounter.ToString()));
                }
                ddlKayamNidhiYear.SelectedIndex = ddlKayamNidhiYear.Items.IndexOf(ddlKayamNidhiYear.Items.FindByValue(DateTime.Now.Year.ToString()));

                //Bind Months
                for (int jCounter = 1; jCounter <= 12; jCounter++)
                {
                    ddlKayamNidhiMonth.Items.Add(new ListItem(jCounter.ToString(), jCounter.ToString()));
                }
                ddlKayamNidhiMonth.SelectedIndex = ddlKayamNidhiMonth.Items.IndexOf(ddlKayamNidhiMonth.Items.FindByValue(DateTime.Now.Month.ToString()));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 15-03-2013
        /// Desc : 
        /// </summary>
        public void BindKaymNidhiCustomerGrid()
        {
            ObjCustomerKayamNidhi = new clsCustomerKayamNidhi();
            dtCustomerKayamNidhi = new DataTable();
            try
            {
                if (!string.IsNullOrEmpty(txtSearchCustomerKayamNidhi.Text) && !string.IsNullOrEmpty(ddlKayamNidhiMonth.SelectedValue))
                {
                    string strsearch = ddlCustomerKayamNidhiSearch.SelectedValue.ToString();
                    switch (strsearch)
                    {
                        case "CustomerNo":
                            ObjCustomerKayamNidhi.CustomerCode = txtSearchCustomerKayamNidhi.Text.ToString();
                            break;
                        case "CusotmerName":
                            ObjCustomerKayamNidhi.FirstName = txtSearchCustomerKayamNidhi.Text.ToString();
                            break;
                        default:
                            break;
                    }
                }
                else
                {
                    ObjCustomerKayamNidhi.CustomerCode = string.Empty;
                    ObjCustomerKayamNidhi.FirstName = string.Empty;
                }

                if (!string.IsNullOrEmpty(ddlKayamNidhiYear.SelectedValue.ToString()))
                {
                    ObjCustomerKayamNidhi.KayamNidhiYear = Convert.ToInt32(ddlKayamNidhiYear.SelectedValue);
                }

                if (!string.IsNullOrEmpty(ddlKayamNidhiMonth.SelectedValue.ToString()))
                {
                    ObjCustomerKayamNidhi.KayamNidhiMonth = Convert.ToInt32(ddlKayamNidhiMonth.SelectedValue);
                }

                dtCustomerKayamNidhi = ObjCustomerKayamNidhi.SelectAllCustomerKayamNidhiWithSearch();
                if (dtCustomerKayamNidhi.Rows.Count > 0)
                {
                    gvCustomerKayamNidhi.DataSource = dtCustomerKayamNidhi;
                }
                else
                {
                    gvCustomerKayamNidhi.DataSource = null;
                }

                gvCustomerKayamNidhi.PageSize = Convert.ToInt32(ddlPager.SelectedValue.ToString());
                gvCustomerKayamNidhi.DataBind();

            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion

        #region Events
        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 14-03-2013
        /// Desc :  
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindKayamNidhiPeriods();
                    BindKaymNidhiCustomerGrid();
                }
                lblKayamNidhiMessage.Text = string.Empty;
            }
            catch { }
        }

        /// <summary>
        /// Added By : Himanshu Pandya 
        /// Date : 14-03-2013
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearchCustomerKayamNidhi_Click(object sender, EventArgs e)
        {
            try
            {
                BindKaymNidhiCustomerGrid();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 14-03-2013
        /// Desc :  
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnClearCustomerKayamNidhi_Click(object sender, EventArgs e)
        {
            ddlCustomerKayamNidhiSearch.SelectedIndex = 0;
            txtSearchCustomerKayamNidhi.Text = string.Empty;
            BindKaymNidhiCustomerGrid();
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 14-03-2013
        /// Desc : 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlPager_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindKaymNidhiCustomerGrid();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 15-03-2013
        /// Desc :  
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvCustomerKayamNidhi_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvCustomerKayamNidhi.PageIndex = e.NewPageIndex;
                BindKaymNidhiCustomerGrid();
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
        protected void gvCustomerKayamNidhi_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ObjCustomerKayamNidhi = new clsCustomerKayamNidhi();
            int iCustomerId, iAccountId;
            decimal iKayamNidhiAmt;
            try
            {
                iCustomerId = Convert.ToInt32(((Label)gvCustomerKayamNidhi.Rows[e.NewEditIndex].FindControl("lblCustomerId")).Text);
                iAccountId = Convert.ToInt32(((Label)gvCustomerKayamNidhi.Rows[e.NewEditIndex].FindControl("lblAccountId")).Text);
                iKayamNidhiAmt = Convert.ToDecimal(((Label)gvCustomerKayamNidhi.Rows[e.NewEditIndex].FindControl("lblCustomerKayamNidhiAmount")).Text);
                if ((iCustomerId > 0) && (iAccountId > 0))
                {
                    ObjCustomerKayamNidhi.CustomerId = iCustomerId;
                    ObjCustomerKayamNidhi.AccountId = iAccountId;
                    if (!string.IsNullOrEmpty(ddlKayamNidhiYear.SelectedValue.ToString()))
                    {
                        ObjCustomerKayamNidhi.KayamNidhiYear = Convert.ToInt32(ddlKayamNidhiYear.SelectedValue);
                    }

                    if (!string.IsNullOrEmpty(ddlKayamNidhiMonth.SelectedValue.ToString()))
                    {
                        ObjCustomerKayamNidhi.KayamNidhiMonth = Convert.ToInt32(ddlKayamNidhiMonth.SelectedValue);
                    }

                    ObjCustomerKayamNidhi.KayamNidhiDepositeDate = DateTime.UtcNow;
                    ObjCustomerKayamNidhi.KayamNidhiAmount = iKayamNidhiAmt;
                    ObjCustomerKayamNidhi.CreatedBy = Convert.ToInt32(AppSessions.GetSession(AppSessions.UDFSessionName._user_id.ToString()));
                    ObjCustomerKayamNidhi.CreatedDate = DateTime.UtcNow;
                    ObjCustomerKayamNidhi.IsActive = true;
                    ObjCustomerKayamNidhi.Insert();
                    if (ObjCustomerKayamNidhi.CustomerKayamNidhiId > 0)
                    {
                        lblKayamNidhiMessage.CssClass = "SuccessfulMessage";
                        lblKayamNidhiMessage.Text = (String)GetGlobalResourceObject("SharedResource", "RecordSavedSuccessfully");
                    }
                    else
                    {
                        lblKayamNidhiMessage.CssClass = "FailureMessage";
                        lblKayamNidhiMessage.Text = (String)GetGlobalResourceObject("SharedResource", "LoginSessionExpire");
                    }
                }
                BindKaymNidhiCustomerGrid();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ObjCustomerKayamNidhi = null;
            }
        }

        /// <summary>
        /// Added By : Himanshu Pandya
        /// Date : 15-03-2013
        /// Desc :  
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnShowCustomerKayamNidhi_Click(object sender, EventArgs e)
        {
            try
            {
                BindKaymNidhiCustomerGrid();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }
}