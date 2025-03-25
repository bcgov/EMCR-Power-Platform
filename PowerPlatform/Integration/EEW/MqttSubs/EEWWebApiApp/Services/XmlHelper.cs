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
                Indent = true, // Enable indentation
                Encoding = Encoding.UTF8, // Use UTF-8 encoding
                OmitXmlDeclaration = false // Include the XML declaration (<?xml version="1.0"?>)
            };

            // Use XmlSerializerNamespaces to suppress xmlns:xsi and xmlns:xsd
            var namespaces = new XmlSerializerNamespaces();
            namespaces.Add(string.Empty, string.Empty); // Add an empty namespace

            using (var stringWriter = new StringWriterUtf8())
            using (var xmlWriter = XmlWriter.Create(stringWriter, xmlSettings))
            {
                xmlSerializer.Serialize(xmlWriter, obj, namespaces); // Pass namespaces here
                return stringWriter.ToString();
            }
        }

        public static decimal GetRandomDecimal()
        {
            Random rand = new Random();
            double randomValue = rand.NextDouble() * (9.9 - 2.0) + 2.0; // Generates between 2.0 and 9.9
            return Math.Round((decimal)randomValue, 1); // Rounds to 1 decimal place
        }

        public static EventMessagePolygon DeserializeEventMessagePolygon(string xml)
        {
            var serializer = new XmlSerializer(typeof(EventMessagePolygon));
            using (var reader = new StringReader(xml))
            {
                return (EventMessagePolygon)serializer.Deserialize(reader);
            }
        }

        public static EventMessageDm DeserializeEventMessageDm(string xml)
        {
            var serializer = new XmlSerializer(typeof(EventMessageDm));
            using (var reader = new StringReader(xml))
            {
                return (EventMessageDm)serializer.Deserialize(reader);
            }
        }

        public static EventMessageMap DeserializeEventMessageMap(string xml)
        {
            var serializer = new XmlSerializer(typeof(EventMessageMap));
            using (var reader = new StringReader(xml))
            {
                return (EventMessageMap)serializer.Deserialize(reader);
            }
        }

        public static void CompareXml(string originalXml, string serializedXml)
        {
            var originalDoc = new XmlDocument();
            originalDoc.LoadXml(originalXml);

            var serializedDoc = new XmlDocument();
            serializedDoc.LoadXml(serializedXml);

            var differences = new List<string>();
            CompareNodes(originalDoc.DocumentElement, serializedDoc.DocumentElement, differences, "/");

            if (differences.Count > 0)
            {
                Console.WriteLine("Differences found:");
                foreach (var diff in differences)
                {
                    Console.WriteLine(diff);
                }
            }
        }

        // Recursively compare XML nodes
        private static void CompareNodes(XmlNode original, XmlNode serialized, List<string> differences, string path)
        {
            if (original == null && serialized == null)
            {
                return;
            }

            if (original == null)
            {
                differences.Add($"Missing in original: {path}");
                return;
            }

            if (serialized == null)
            {
                differences.Add($"Missing in serialized: {path}");
                return;
            }

            // Compare node names
            if (original.Name != serialized.Name)
            {
                differences.Add($"Node name mismatch at {path}: {original.Name} vs {serialized.Name}");
            }

            // Compare attributes
            CompareAttributes(original, serialized, differences, path);

            // Compare child nodes
            var originalChildren = original.ChildNodes;
            var serializedChildren = serialized.ChildNodes;

            // Compare the number of child nodes
            if (originalChildren.Count != serializedChildren.Count)
            {
                differences.Add($"Child node count mismatch at {path}: {originalChildren.Count} vs {serializedChildren.Count}");
            }

            // Compare each child node recursively
            for (int i = 0; i < Math.Min(originalChildren.Count, serializedChildren.Count); i++)
            {
                CompareNodes(originalChildren[i], serializedChildren[i], differences, $"{path}/{originalChildren[i].Name}[{i}]");
            }
        }

        // Compare attributes of two nodes
        private static void CompareAttributes(XmlNode original, XmlNode serialized, List<string> differences, string path)
        {
            var originalAttrs = original.Attributes;
            var serializedAttrs = serialized.Attributes;

            // Check for missing attributes in serialized
            if (originalAttrs != null)
            {
                foreach (XmlAttribute attr in originalAttrs)
                {
                    var serializedAttr = serializedAttrs?[attr.Name];
                    if (serializedAttr == null)
                    {
                        differences.Add($"Missing attribute in serialized: {path}/{attr.Name}");
                    }
                    else if (attr.Value != serializedAttr.Value)
                    {
                        differences.Add($"Attribute value mismatch at {path}/{attr.Name}: {attr.Value} vs {serializedAttr.Value}");
                    }
                }
            }

            // Check for extra attributes in serialized
            if (serializedAttrs != null)
            {
                foreach (XmlAttribute attr in serializedAttrs)
                {
                    var originalAttr = originalAttrs?[attr.Name];
                    if (originalAttr == null)
                    {
                        differences.Add($"Extra attribute in serialized: {path}/{attr.Name}");
                    }
                }
            }
        }
    }

    // Custom StringWriter to ensure UTF-8 encoding
    public class StringWriterUtf8 : StringWriter
    {
        public override Encoding Encoding => Encoding.UTF8;
    }
}
