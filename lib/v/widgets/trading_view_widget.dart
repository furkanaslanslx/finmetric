import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';

class TradingViewWidget extends StatefulWidget {
  final String symbol;

  const TradingViewWidget({super.key, required this.symbol});

  @override
  State<TradingViewWidget> createState() => _TradingViewWidgetState();
}

class _TradingViewWidgetState extends State<TradingViewWidget> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.dataFromString(
        _generateHtml(widget.symbol),
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ));
  }

  String _generateHtml(String symbol) {
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <style>
    html, body {
      margin: 0;
      padding: 0;
      width: 100%;
      height: 100%;
      overflow: hidden;
    }
    .tradingview-widget-container {
      width: 100% !important;
      height: 100% !important;
      background-color: lightgray;
    }
  </style>
</head>
<body>
  <!-- TradingView Widget BEGIN -->
  <div class="tradingview-widget-container">
    <div id="tradingview_abc"></div>
    <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
    <script type="text/javascript">
    new TradingView.widget(
      {
        "width": "100%",
        "height": "100%",
        "autosize": false,
        "symbol": "$symbol",
        "interval": "D",
        "timezone": "Etc/UTC",
        "theme": "dark",
        "style": "1",
        "locale": "tr",
        "toolbar_bg": "#f1f3f6",
        "enable_publishing": false,
        "allow_symbol_change": true,
        "container_id": "tradingview_abc"
      }
    );
    </script>
  </div>
  <!-- TradingView Widget END -->
</body>
</html>
''';
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }

  @override
  void didUpdateWidget(TradingViewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.symbol != oldWidget.symbol) {
      _controller.loadRequest(Uri.dataFromString(
        _generateHtml(widget.symbol),
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ));
    }
  }
}
