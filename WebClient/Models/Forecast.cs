using System;
using Newtonsoft.Json;

namespace SampleMvcApp.Models;

public class Forecast
{
    [JsonProperty("date")]
    public DateTime Date { get; set; }
    [JsonProperty("temperatureC")]
    public int TemperatureC { get; set; }
    [JsonProperty("temperatureF")]
    public int TemperatureF { get; set; }
    [JsonProperty("summary")]
    public string Summary { get; set; }
}