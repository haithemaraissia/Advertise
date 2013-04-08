using System;
using System.Linq;
using System.Web.Security;


public partial class SideJobSignUp : System.Web.UI.Page
{
    readonly int _nextCustomerID = GetNextCustomer();
    protected void Page_Load(object sender, EventArgs e)
    {
        CreateCustomer();

    }

    public void CreateCustomer()
    {
        const int lcid = 1;
        var user = Membership.GetUser();
        if (user != null)
        {
            var userKey = user.ProviderUserKey;

            if (userKey != null)
            {
                InsertNewCustomer(_nextCustomerID, user.ToString(), lcid);
                InsertCustomerTables(user.ToString());
                CustomerSpecificInformation();
                InsertCustomerPicture(_nextCustomerID, GetNextAlbumID());
                //DEPEING ON THE GENDER SET THE PHOTOPATH
                InsertCustomerPhoto(GetNextPhotoID(), GetPath(), GetNextAlbumID() - 1, _nextCustomerID);
                InsertEvents();
                InsertMessage();
                InsertCustomerMessageInbox();
                InsertCustomerPortfolio();
                InsertCommentReceivedSummary();
                InsertCustomerAdditionalInformation();
                InsertCustomerRating();

            }
        }

    }


    public void InsertNewCustomer(int nextcustomerID, string userName, int lcid)
    {
        var context = new SidejobModel.SidejobEntities();
        context.InsertNewCustomer(nextcustomerID, userName, lcid,Admanagment.Helpers.Utility.GetUserID());
    }

    public void InsertCustomerTables(string username)
    {

        var context = new SidejobModel.SidejobEntities();
        var customerGeneral = new SidejobModel.CustomerGeneral
                                  {
                                      CustomerID = _nextCustomerID,
                                      FirstName = "sidefirstname",
                                      LastName = "sidelastname",
                                      UserName = username,
                                      Address = "sideadress",
                                      CountryID = 200,
                                      CountryName = "sidecountryanme",
                                      RegionID = 12,
                                      RegionName = "sideregionname",
                                      CityID = 3,
                                      CityName = "sidecityname",
                                      Zipcode = "58742",
                                      HomePhoneNumber = "913-406-0298",
                                      MobilePhoneNumber = "913-486-0298",
                                      Age = 50,
                                      Gender = 1,
                                      EmailAddress = "fromsideside@yahoo.com",
                                      PhotoPath = "sidepath"
                                  };
        context.AddToCustomerGenerals(customerGeneral);
        context.SaveChanges();
    }

    public void CustomerSpecificInformation()
    {
        var context = new SidejobModel.SidejobEntities();
        var customspecificinformation = new SidejobModel.CustomerSpecificInformation { Age = 50, EmailAddress = "fromsideside@yahoo.com", Gender = 1, CustomerID = _nextCustomerID };
        context.AddToCustomerSpecificInformations(customspecificinformation);
        context.SaveChanges();
    }

    public void InsertCustomerPicture(int nextCustomerId, int nextAlbumID)
    {
        var context = new SidejobModel.SidejobEntities();
        context.InsertCustomerPicture(nextCustomerId, nextAlbumID);
    }

    public void InsertCustomerPhoto(int nextPhotoID, string photoPath, int nextAlbumID, int nextCustomerid)
    {
        var context = new SidejobModel.SidejobEntities();
        context.InsertCustomerPhoto(nextPhotoID, photoPath, nextAlbumID, nextCustomerid);
    }

    public void InsertEvents()
    {
        const int lcid = 1;
        int nextEventID = GetNextEventID();
        var context = new SidejobModel.SidejobEntities();
        context.InsertEvent(nextEventID, DateTime.Now.Date, lcid);

        var customerEvent = new SidejobModel.CustomerEvent
                                {
                                    CustomerID = _nextCustomerID,
                                    EventID = GetNextEventID(),
                                    NumberofEvents = 1,
                                    Type = 1
                                };

        context.AddToCustomerEvents(customerEvent);
    }

    public void InsertMessage()
    {
        var context = new SidejobModel.SidejobEntities();
        context.InsertMessage(GetNextMessageID(), _nextCustomerID, User.Identity.Name, DateTime.Now.Date);

    }

    public void InsertCustomerMessageInbox()
    {
        var context = new SidejobModel.SidejobEntities();
        var customerMessageInbox = new SidejobModel.CustomerMessageInbox
                                       {
                                           MessageID = GetNextMessageID(),
                                           CustomerID = _nextCustomerID,
                                           SenderName = "Side Job Team",
                                           ReceiverName = User.Identity.Name,
                                           Date = DateTime.Now.Date,
                                           Title = "Welcome To Side Jobs",
                                           Description =
                                               "Thank you for becoming a memeber of this service, here you can save a lot of time and money....",
                                           Checked = 1
                                       };
        context.AddToCustomerMessageInboxes(customerMessageInbox);
    }

    public void InsertCustomerPortfolio()
    {
        var context = new SidejobModel.SidejobEntities();
        var customerportfolio = new SidejobModel.CustomerPortfolio
                                    {
                                        CustomerID = _nextCustomerID,
                                        About = "",
                                        SpecialNotes = "",
                                        Modified = 0
                                    };
        context.AddToCustomerPortfolios(customerportfolio);
    }

    public void InsertCommentReceivedSummary()
    {
        var context = new SidejobModel.SidejobEntities();
        var customercommentreceivedsummary = new SidejobModel.CustomerCommentReceivedSummary
                                                 {
                                                     CustomerID = _nextCustomerID,
                                                     NumberofPositive = 0,
                                                     NumberofNegative = 0,
                                                     NumberofNeutral = 0,
                                                     Total = 0,
                                                     Percentage = 100
                                                 };
        context.AddToCustomerCommentReceivedSummaries(customercommentreceivedsummary);
    }

    public void InsertCustomerAdditionalInformation()
    {
        var context = new SidejobModel.SidejobEntities();
        var customeradditionalinformation = new SidejobModel.CustomerAdditionalInformation
                                                {
                                                    CustomerID = _nextCustomerID,
                                                    DateCreated = DateTime.Now.Date,
                                                    PeopleVisited = 0,
                                                    InvitationSent = 0,
                                                    Points = 0,
                                                    ProjectPosted = 0
                                                };
        context.AddToCustomerAdditionalInformations(customeradditionalinformation);
    }

    public void InsertCustomerRating()
    {
        var context = new SidejobModel.SidejobEntities();
        var customerrating = new SidejobModel.CustomerRating
                                 {
                                     RateID = GetNextRatingID(),
                                     CustomerID = _nextCustomerID,
                                     Postive = 0,
                                     Negative = 0,
                                     Neutral = 0,
                                     Total = 0,
                                     Percentage = 0,
                                     IntRate1 = 0,
                                     DoubleRate = 0,
                                     IntRate = 0
                                 };
        context.AddToCustomerRatings(customerrating);

    }



















    public string GetPath()
    {

        return "Path";
    }





    public static int GetNextCustomer()
    {
        int id;
        var context = new SidejobModel.SidejobEntities();
        var max = context.Customers.OrderByDescending(s => s.CustomerID).FirstOrDefault();

        if (max == null)
        {
            id = 0;
        }
        else
        {
            id = max.CustomerID + 1;
        }
        return id;
    }

    public static int GetNextAlbumID()
    {
        int id;
        var context = new SidejobModel.SidejobEntities();
        var max = context.CustomerPictures.OrderByDescending(s => s.AlbumID).FirstOrDefault();

        if (max == null)
        {
            id = 0;
        }
        else
        {
            id = max.AlbumID + 1;
        }
        return id;
    }

    public static int GetNextPhotoID()
    {
        int id;
        var context = new SidejobModel.SidejobEntities();
        var max = context.CustomerPhotoes.OrderByDescending(s => s.PhotoID).FirstOrDefault();

        if (max == null)
        {
            id = 0;
        }
        else
        {
            id = max.PhotoID + 1;
        }
        return id;
    }

    public static int GetNextEventID()
    {
        int id;
        var context = new SidejobModel.SidejobEntities();
        var max = context.Events.OrderByDescending(s => s.EventID).FirstOrDefault();

        if (max == null)
        {
            id = 0;
        }
        else
        {
            id = max.EventID + 1;
        }
        return id;
    }

    public static int GetNextMessageID()
    {
        int id;
        var context = new SidejobModel.SidejobEntities();
        var max = context.Messages.OrderByDescending(s => s.MessageID).FirstOrDefault();

        if (max == null)
        {
            id = 0;
        }
        else
        {
            id = max.MessageID + 1;
        }
        return id;
    }

    public static int GetNextRatingID()
    {
        int id;
        var context = new SidejobModel.SidejobEntities();
        var max = context.CustomerRatings.OrderByDescending(s => s.RateID).FirstOrDefault();

        if (max == null)
        {
            id = 0;
        }
        else
        {
            id = max.RateID + 1;
        }
        return id;
    }

}

//public static void InsertCustomer()
//{


//    using (SidejobModel.SidejobEntities context = new SidejobModel.SidejobEntities())
//    {


//        //Anything with identity have to be created in store procedure and execute it.
//            context.Connection.Open();
//            int i = context.ExecuteStoreCommand("SET IDENTITY_INSERT dbo.Customer ON");
//            var c = new SidejobModel.Customer();
//            c.CustomerID = 500;
//            c.UserName = "test";
//            c.LCID = 1;
//            context.Customers.AddObject(c);
//            context.SaveChanges();
//            i = context.ExecuteStoreCommand("SET IDENTITY_INSERT dbo.Customer OFF");

//        }
//    }











//////////////////////////////////////////////////////LEFT///////////////////////////////////////////////////////////////////
// EXEC @RC = [dbo].[GetUserIdByUserName] @USERNAME, @UserIdConverted OUTPUT 	
//SET @UserId = @UseridConverted
//--LOOK UP TABLE : 
//--THINK ABOUT THE USER WHO ALREADY SIGN UP BUT GOT KICK AND WANT TO REGISTER AGAIN

//--RECHECK THIS TABLE

//SELECT     FirstName, LastName, Country, Region, Age, Gender, EmailAddress
//FROM         LockedUser
//WHERE     (FirstName = LOWER(@FirstName)) AND (LastName = LOWER(@LastName)) AND (Country = @CountryName) AND 
//                      (EmailAddress = LOWER(@EmailAddress)) AND (Gender = @Gender) AND (Age = @Age) AND (Region = @RegionName)
//Set @RowCount = @@RowCount
//    IF @RowCount = 1   
//     BEGIN
//        SET @ErrorCode = 99
//        GOTO Cleanup
//    END


//--2--Look Up 
//    INSERT INTO LookUpRoles
//                          (UserId, CustomerId, ProfessionalId)
//    VALUES     (@UserId,@NextCustomerID, 0)
//////////////////////////////////////////////////////LEFT///////////////////////////////////////////////////////////////////
