package android.src.main.java.mdesigner.ios.microduino.com.flutter_microduino_html;

import android.os.Build;
import android.util.Log;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;

import com.github.lzyzsd.jsbridge.BridgeWebView;
import com.github.lzyzsd.jsbridge.BridgeWebViewClient;

/*
 * ：Created by z on 2018/8/23
 */
public class MyWebClient extends BridgeWebViewClient {
    private String TAG = "xiaoqiang";
    private String jsFunctionStr;

    public MyWebClient(BridgeWebView webView, String jsFunctionStr) {
        super(webView);
        this.jsFunctionStr = jsFunctionStr;
    }

    @Override
    public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
        return super.shouldOverrideUrlLoading(view, request);
    }

    @Override
    public void onPageFinished(WebView webView, String url) {
        super.onPageFinished(webView, url);
        if(jsFunctionStr != null)webView.loadUrl(jsFunctionStr);
    }

    @Override
    public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
        if (android.os.Build.VERSION.SDK_INT > 23) {
            Log.e(TAG, "网页onReceivedError1: " + error.getErrorCode() + " " + error.getDescription());
        } else {
            Log.e(TAG, "网页onReceivedError1: " + error);
        }

        super.onReceivedError(view, request, error);

    }

    @Override
    public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
        Log.e(TAG, "网页onReceivedError异常2: " + errorCode + " " + description + " " + failingUrl);
        super.onReceivedError(view, errorCode, description, failingUrl);

    }


}
