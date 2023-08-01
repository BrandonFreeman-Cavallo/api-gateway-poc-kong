using Grpc.Core;

namespace GrpcTest.Docker.Services;

public class CalculatorService : Calculator.CalculatorBase
{
    public override Task<MultiplyResult> Multiply(MultiplyRequest request, ServerCallContext context)
    {
        return Task.FromResult(new MultiplyResult
        {
            Result = request.X * request.Y
        });
    }
}