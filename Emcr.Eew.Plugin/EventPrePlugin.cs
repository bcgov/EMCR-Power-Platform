using Microsoft.Xrm.Sdk;
using System;

namespace Emcr.Eew.Plugin
{
    public class EventPostPlugin : IPlugin
    {
        public void Execute(IServiceProvider serviceProvider)
        {
            // Obtain the execution context
            IPluginExecutionContext context = (IPluginExecutionContext)serviceProvider.GetService(typeof(IPluginExecutionContext));

            // Ensure this is being triggered on Create (PostOperation)
            if (context.MessageName.ToLower() != "create" || context.Stage != 40)
                return;

            // Obtain the IOrganizationService
            IOrganizationServiceFactory serviceFactory = (IOrganizationServiceFactory)serviceProvider.GetService(typeof(IOrganizationServiceFactory));
            IOrganizationService service = serviceFactory.CreateOrganizationService(context.UserId);

            // Retrieve the newly created record (as createdon is available in post)
            Entity entity = service.Retrieve(context.PrimaryEntityName, (Guid)context.OutputParameters["id"], new Microsoft.Xrm.Sdk.Query.ColumnSet("createdon"));

            if (!entity.Contains("createdon")) return;

            // Get CreatedOn datetime
            DateTime createdOn = entity.GetAttributeValue<DateTime>("createdon");

            // Extract seconds and milliseconds
            decimal secondsWithMilliseconds = createdOn.Second + (decimal)createdOn.Millisecond / 1000;

            // Update the record with the computed value
            Entity updateEntity = new Entity(context.PrimaryEntityName)
            {
                Id = entity.Id,
                ["emcr_createdonseconds"] = secondsWithMilliseconds
            };
            service.Update(updateEntity);
        }
    }
}

