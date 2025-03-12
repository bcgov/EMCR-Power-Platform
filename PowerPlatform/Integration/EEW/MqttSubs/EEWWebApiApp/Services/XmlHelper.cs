using System.Text;
using System.Xml.Serialization;
using System.Xml;

namespace EEWWebApiApp.Services
{
    public static class XmlHelper
    {
        public static string SerializeToXml<T>(T obj)
        {
            if (obj == null) throw new ArgumentNullException(nameof(obj));

            var xmlSerializer = new XmlSerializer(typeof(T));
            var xmlSettings = new XmlWriterSettings
            {
                Indent = true,
                Encoding = Encoding.UTF8,
                OmitXmlDeclaration = false
            };

            using (var stringWriter = new StringWriterUtf8())
            using (var xmlWriter = XmlWriter.Create(stringWriter, xmlSettings))
            {
                xmlSerializer.Serialize(xmlWriter, obj);
                return stringWriter.ToString();
            }
        }

        public static decimal GetRandomDecimal()
        {
            Random rand = new Random();
            double randomValue = rand.NextDouble() * (9.9 - 2.0) + 2.0; // Generates between 2.0 and 9.9
            return Math.Round((decimal)randomValue, 1); // Rounds to 1 decimal place
        }
    }

    // Custom StringWriter to ensure UTF-8 encoding
    public class StringWriterUtf8 : StringWriter
    {
        public override Encoding Encoding => Encoding.UTF8;
    }
}
