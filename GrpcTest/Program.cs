using GrpcTest.Docker.Services;

// var loggerFactory = LoggerFactory.Create(builder =>
// {
//     builder.AddFilter("Microsoft", LogLevel.Warning)
//            .AddFilter("System", LogLevel.Warning)
//            .AddFilter("GrpcTest.Docker", LogLevel.Debug)
//            .AddConsole();
// });

var builder = WebApplication.CreateBuilder(args);
builder.Logging.ClearProviders();
builder.Logging.AddConsole();

builder.Services.AddGrpc();
builder.Services.AddGrpcReflection();
// builder.Logging.AddProvider(loggerFactory);

var app = builder.Build();

// Configure the HTTP request pipeline.
app.MapGrpcService<CalculatorService>();
app.MapGrpcService<GibberishCollectionService>();
app.MapGrpcService<GreeterService>();

app.MapGet("/", () => "Communication with gRPC endpoints must be made through a gRPC client. To learn how to create a client, visit: https://go.microsoft.com/fwlink/?linkid=2086909");

// if (app.Environment.IsDevelopment())
if (true)
{
    app.MapGrpcReflectionService();
}

app.Run();
