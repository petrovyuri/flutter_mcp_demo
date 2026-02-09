import 'dart:async';
import 'dart:io' as io;

import 'package:dart_mcp/server.dart';
import 'package:dart_mcp/stdio.dart';

void main() {
  DemoMCPServer(stdioChannel(input: io.stdin, output: io.stdout));
}

base class DemoMCPServer extends MCPServer with ToolsSupport {
  DemoMCPServer(super.channel)
      : super.fromStreamChannel(
          implementation: Implementation(
            name: "demo_mcp",
            version: "1.0.0",
          ),
        );

  @override
  FutureOr<InitializeResult> initialize(InitializeRequest request) {
    registerTool(
      Tool(
        name: "get_time",
        description: "Получить текущее время",
        inputSchema: ObjectSchema(),
      ),
      (arguments) async {
        return CallToolResult(
          content: [
            TextContent(
              text:
                  "Текущее время в ISO8601: ${DateTime.now().toIso8601String()}",
            ),
          ],
        );
      },
    );
    return super.initialize(request);
  }
}
