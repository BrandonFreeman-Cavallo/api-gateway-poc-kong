using Grpc.Core;

namespace GrpcTest.Docker.Services;

public class GibberishCollectionService : GibberishCollection.GibberishCollectionBase
{
    private readonly ILogger<GibberishCollectionService> _logger;
    public GibberishCollectionService(ILogger<GibberishCollectionService> logger)
    {
        _logger = logger;
    }

    public override Task<GibberishReply> Get(GibberishRequest request, ServerCallContext context)
    {
        int count = request.Count;

        GibberishReply reply = new GibberishReply {
            Count = count,
        };

        for (int i = 0; i < request.Count; i++)
        {
            reply.Collection.Add(Guid.NewGuid().ToString());
        }

        return Task.FromResult(reply);
    }
}
