import 'package:mcp_dart/mcp_dart.dart';

void main() {
  final server = McpServer(Implementation(name: "demo_mcp", version: "1.0.0"));
  server.registerTool(
    "get_time",
    callback: (args, extra) {
      return CallToolResult.fromContent([
        TextContent(
          text: "Текущее время в ISO8601: ${DateTime.now().toIso8601String()}",
        ),
      ]);
    },
  );

  server.connect(StdioServerTransport());
}
