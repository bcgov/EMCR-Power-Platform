using Microsoft.Identity.Client;
using Newtonsoft.Json.Linq;
using System.Net.Http.Headers;
using System.Text;

namespace EEWWebApiApp.Services
{
    public class CRMHelper
    {
        private readonly D365Settings _settings;

        public CRMHelper(D365Settings settings)
        {
            _settings = settings;
        }

        private async Task<string> GetAccessTokenAsync()
        {
            string authority = $"https://login.microsoftonline.com/{_settings.TenantId}";
            string[] scopes = new string[] { $"{_settings.CrmBaseUrl}/.default" };

            IConfidentialClientApplication app = ConfidentialClientApplicationBuilder.Create(_settings.ClientId)
                .WithClientSecret(_settings.ClientSecret)
                .WithAuthority(new Uri(authority))
                .Build();

            AuthenticationResult result = await app.AcquireTokenForClient(scopes).ExecuteAsync();
            return result.AccessToken;
        }

        public async Task<string> CreateRecordAsync(string entityName, JObject record)
        {
            string accessToken = await GetAccessTokenAsync();
            string requestUri = $"{_settings.CrmBaseUrl}api/data/v9.2/{entityName}";

            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", accessToken);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpContent content = new StringContent(record.ToString(), Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.PostAsync(requestUri, content);

                if (response.IsSuccessStatusCode)
                {
                    string responseBody = await response.Content.ReadAsStringAsync();
                    return responseBody;
                }
                else
                {
                    string errorResponse = await response.Content.ReadAsStringAsync();
                    throw new Exception($"Error creating record: {response.StatusCode} - {errorResponse}");
                }
            }
        }

        public async Task<bool> FetchRecordsAsync(string entityName, string fetchXml)
        {
            string accessToken = await GetAccessTokenAsync();
            string requestUri = $"{_settings.CrmBaseUrl}api/data/v9.2/{entityName}?fetchXml={Uri.EscapeDataString(fetchXml)}";

            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", accessToken);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                client.DefaultRequestHeaders.CacheControl = new CacheControlHeaderValue
                {
                    NoCache = true,
                    NoStore = true,
                    MustRevalidate = true
                };

                HttpResponseMessage response = await client.GetAsync(requestUri);

                if (response.IsSuccessStatusCode)
                {
                    string responseBody = await response.Content.ReadAsStringAsync();
                    if (responseBody.Contains("[]"))
                    {
                        return false;
                    }
                    return true;
                }
                else
                {
                    string errorResponse = await response.Content.ReadAsStringAsync();

                    Console.WriteLine("Error from CRM call: " + errorResponse);
                    return false;
                }
            }
        }
    }
}