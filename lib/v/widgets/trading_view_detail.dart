import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';

class TradingViewDetail extends StatefulWidget {
  final String symbol;

  const TradingViewDetail({super.key, required this.symbol});

  @override
  State<TradingViewDetail> createState() => _TradingViewDetailState();
}

class _TradingViewDetailState extends State<TradingViewDetail> {
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
  <div class="tradingview-widget-container__widget"></div>
  <div class="tradingview-widget-copyright"><a href="https://tr.tradingview.com/" rel="noopener nofollow" target="_blank"><span class="blue-text">Tüm piyasaları TradingView üzerinden takip edin</span></a></div>
  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-financials.js" async>
  {
  "isTransparent": false,
  "largeChartUrl": "",
  "displayMode": "regular",
  "width": "100%",
  "height": "100%",
  "colorTheme": "dark",
  "symbol": "$symbol",
  "toolbar_bg": "#f1f3f6",
  "locale": "tr"
}
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
  void didUpdateWidget(TradingViewDetail oldWidget) {
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
