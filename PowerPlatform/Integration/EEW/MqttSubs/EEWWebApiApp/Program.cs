using EEWWebApiApp.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddOpenApi(); // OpenAPI support

// Register logging
builder.Services.AddLogging();

// Register background service with dependency injection
builder.Services.AddSingleton<NrCanMqttBackGroundService>();  // Use Singleton if needed elsewhere
builder.Services.AddHostedService(provider => provider.GetRequiredService<NrCanMqttBackGroundService>());

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();

app.Run();

