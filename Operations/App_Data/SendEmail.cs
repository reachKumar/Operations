using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Configuration;
using System.Globalization;

namespace Operations
{
    public class SendEmail
    {
        //public string MailHost = ConfigurationManager.ConnectionStrings["SMTPServer"].ToString();

        //public string MailTo = ConfigurationManager.ConnectionStrings["MailTo"].ToString();

        EntityGeneratorDetails objEntityGeneratorDetails = null;

        public string SendMail(string subject, string messageBody)
        {
            objEntityGeneratorDetails = new EntityGeneratorDetails();
            try
            {
                string FromCC = "noreply@hibernianetworks.com";

                SmtpClient smtpclient = new SmtpClient("smtp.hiberniaatlantic.com");

                MailMessage Msg = new MailMessage();

                MailAddress FromAddress = new MailAddress(FromCC);

                Msg.From = FromAddress;

                Msg.To.Add("facilities@hiberniatnetworks.com");
                Msg.Subject = subject;
                Msg.IsBodyHtml = true;

                string Message = messageBody;

                Msg.Body = Message;
                Msg.DeliveryNotificationOptions = DeliveryNotificationOptions.OnSuccess;
                Msg.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                Msg.DeliveryNotificationOptions = DeliveryNotificationOptions.Delay;
                Msg.DeliveryNotificationOptions = DeliveryNotificationOptions.None;

                Msg.Headers.Add("Disposition-Notifications-To", "facilities@hiberniatnetworks.com");

                smtpclient.Send(Msg);
                objEntityGeneratorDetails.SuccessMessage = string.Empty;
                objEntityGeneratorDetails.SuccessMessage = "Mail sent";

            }
            catch (Exception et)
            {
                objEntityGeneratorDetails.ErrorMessage = "<b>Mail send to fail : </b>" + et.Message.ToString(); 
            }
            return objEntityGeneratorDetails.SuccessMessage;

        }
    }
}