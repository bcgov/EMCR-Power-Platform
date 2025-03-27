namespace EEWWebApiApp.Services
{
    public class D365Settings
    {
        public string ClientId { get; set; }
        public string ClientSecret { get; set; }
        public string TenantId { get; set; }
        public string CrmBaseUrl { get; set; }
        public LoggingLevel LoggingLevel { get; set; }
    }

    public enum LoggingLevel
    {
        Polygon,
        Point,
        General,
        None,
        All
    }

    public class MQTTSettings
    {
        public string[] Brokers { get; set; }
        public string Username { get; set; }
        public int Port { get; set; }
        public string Password { get; set; }
        public string CoreXmlTopic { get; set; }
        public string GroundMotionPolygonTopic { get; set; }
        public string GroundMotionPointsTopic { get; set; }
        public string EEWOverallHealth { get; set; }
    }
}
