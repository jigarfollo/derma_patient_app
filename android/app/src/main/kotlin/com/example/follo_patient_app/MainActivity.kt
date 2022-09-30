package com.folloplatforms.derma.patient

import android.view.WindowManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

// Added these three import lines
import android.view.WindowManager.LayoutParams;
import android.os.Bundle;

class MainActivity: FlutterFragmentActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }    
}
