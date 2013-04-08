Imports System.Xml

Partial Class GoogleImageSiteMapVB
    Inherits System.Web.UI.Page

    Private Sub WriteImageSitemap(ByVal urls As IDictionary(Of String, IEnumerable(Of String)))
        Const smNs As String = "http://www.sitemaps.org/schemas/sitemap/0.9"
        Const imgNs As String = "http://www.google.com/schemas/sitemap-image/1.1"
        Const imgPf As String = "image"


        Using xw As XmlWriter = XmlWriter.Create(Response.Output, New XmlWriterSettings() With {.Indent = True})
            xw.WriteStartDocument()
            xw.WriteStartElement("urlset", smNs)
            xw.WriteAttributeString("xmlns", imgPf, "http://www.w3.org/2000/xmlns/", imgNs)
            For Each url As String In urls.Keys
                xw.WriteStartElement("url", smNs)
                xw.WriteElementString("loc", smNs, url)
                For Each img As String In urls(url)
                    xw.WriteStartElement(imgPf, "image", imgNs)
                    xw.WriteElementString(imgPf, "loc", imgNs, img)
                    xw.WriteEndElement()
                Next
                xw.WriteEndElement()
            Next
            xw.WriteEndElement()
            xw.WriteEndDocument()
        End Using
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim smData As New Dictionary(Of String, IEnumerable(Of String))
        Dim imgList As New List(Of String)()
        imgList.Add("http://example.com/image.jpg")
        imgList.Add("http://example.com/photo.jpg")
        smData.Add("http://example.com/sample.html", imgList)
        Response.ContentType = "application/xml"
        WriteImageSitemap(smData)
        Response.End()
    End Sub
End Class

