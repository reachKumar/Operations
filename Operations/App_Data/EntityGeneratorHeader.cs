using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Operations
{
    public class EntityGeneratorHeader
    {

        public   Int64  GWID
        {
            get;
            set;
        }
        
	    public string SiteLocation   
        {
            get;
           set;
        }
        
	    public string CarriedOutBy    
	    {
            get;
            set;
        }
        public string TestingStartedDate    
	    {
            get;
           set;
        }
        public string TestingCompleDate 
	    {
            get;
           set;
        } 
        public decimal  FuelTank1   
	    {
            get;
            set;
        } 
        public decimal  Pump1Running    
	    {
            get;
           set;
        }
        public decimal  FuelTank2   
	    {
            get;
           set;
       } 
        public decimal Pump2Running   
        {
            get;
            set;
       }
        public string SiteName
        {
            get;
            set;
        }
    }
}