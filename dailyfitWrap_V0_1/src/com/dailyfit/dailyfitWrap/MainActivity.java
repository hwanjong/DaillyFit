package com.dailyfit.dailyfitWrap;

import org.json.JSONException;
import org.json.JSONObject;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.WindowManager;
import android.webkit.JavascriptInterface;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;

public class MainActivity extends Activity {

	private WebView webView;
	public static Context valContext;
	public static boolean EXIT = false;

	/** Called when the activity is first created. */
	@SuppressLint("SetJavaScriptEnabled")
	@Override
	public void onCreate(Bundle savedInstanceState) {
		if(android.os.Build.VERSION.SDK_INT >= 11){
			getWindow().addFlags(16777216);		//	하드웨어가속
		}

		getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);	//	화면꺼짐방지
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		webView = (WebView) findViewById(R.id.webview);
		webView.getSettings().setJavaScriptEnabled(true);

		String userAgent = webView.getSettings().getUserAgentString();
		webView.getSettings().setUserAgentString(userAgent+" APP_ANDROID");

		webView.addJavascriptInterface(new AndroidBridge(), "AndroidApp");

		webView.setWebViewClient(new WebViewClient());

		valContext = this;
		webView.setWebChromeClient(new WebChromeClient(){
			// alert, confirm 처리용
			@Override
			public boolean onJsAlert(WebView view, String url, String message,
					final android.webkit.JsResult result){
				new AlertDialog.Builder(valContext)
				.setTitle("데일리핏 알림")
				.setMessage(message)
				.setPositiveButton(android.R.string.ok,
						new AlertDialog.OnClickListener(){
					public void onClick(DialogInterface dialog, int which){
						result.confirm();
					}
				})
				.setCancelable(false)
				.create()
				.show();
				return true;
			};
		});

		//		deviceBasic.setBOARD_ACTIVITY_STATUS("CREATE");

		webView.loadUrl("http://211.189.127.121/dailyfit/main.ap");

	}
//	@Override
//	public boolean onCreateOptionsMenu(Menu menu) {
//		// TODO Auto-generated method stub
//		menu.add(0,0,0,"홈").setIcon(android.R.drawable.ic_menu_revert);
//		menu.add(0,1,0,"새로고침").setIcon(android.R.drawable.ic_menu_rotate);
//		menu.add(0,2,0,"검색").setIcon(android.R.drawable.ic_menu_search);
//		return true;
//	}
//
//	@Override
//	public boolean onOptionsItemSelected(MenuItem item) {
//		// TODO Auto-generated method stub
//				switch (item.getItemId()) {
//				case 0:
//					webView.loadUrl("http://211.189.127.121/dailyfit/main.ap");
//					break;
//				case 1:
//					webView.reload();
//					break;
//				case 2:
//					callWebviewScriptFunction("search()");
//					break;
//				default:
//					break;
//				}
//		return super.onOptionsItemSelected(item);
//	}
//	@Override
//	public void onOptionsMenuClosed(Menu menu) {
//		// TODO Auto-generated method stub
//	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		// TODO Auto-generated method stub
		if (keyCode == KeyEvent.KEYCODE_MENU) {
			// Do Stuff
			callWebviewScriptFunction("menuBar()");
			return true;
		} 
		return super.onKeyDown(keyCode, event);
	}
	@Override
	public void onBackPressed() {
		if (webView.canGoBack()) {
			webView.goBack();
		} else {
			webView.clearCache(true);
			destroyApp();
		}
	}

	// APP -> WEB script함수호출
	public void callWebviewScriptFunction(String scriptStr){
		webView.loadUrl("javascript:" + scriptStr);
	}

	//	// WEB -> APP native함수호출
	private class AndroidBridge{
		@JavascriptInterface
		public void testToast(String text) { // must be final
			Toast.makeText(getApplicationContext(), text, 2000).show();
		}
		@JavascriptInterface
		public void finishApp() { // must be final
			destroyApp();
		}
	}

	public void destroyApp(){
		new AlertDialog.Builder(valContext)
		.setTitle("종료")
		.setMessage("데일리핏 종료할꺼니?")
		.setPositiveButton(android.R.string.ok,
				new AlertDialog.OnClickListener(){
			public void onClick(DialogInterface dialog, int which){
				finish();
				android.os.Process.killProcess(android.os.Process.myPid());
			}
		}).setNegativeButton(android.R.string.cancel, new AlertDialog.OnClickListener(){
			public void onClick(DialogInterface dialog, int which){
				Toast.makeText(getApplicationContext(), "종료취소되었습니다", 1000).show();;
			}
		})
		.setCancelable(false)
		.create()
		.show();
	}


}
