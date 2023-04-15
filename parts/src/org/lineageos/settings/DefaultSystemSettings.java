/*
 * Copyright (C) 2022 The LineageOS Project
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 */

package org.lineageos.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.UserHandle;
import android.provider.DeviceConfig;
import android.provider.DeviceConfig.Properties;
import android.provider.Settings;
import android.util.Log;

import androidx.preference.PreferenceManager;

//import lineageos.providers.LineageSettings;

public class DefaultSystemSettings {
    private static final String TAG = "DefaultSystemSettings";
    private static final boolean DEBUG = false;

    private Context mContext;
    private SharedPreferences mSharedPrefs;

    public DefaultSystemSettings(final Context context) {
        mContext = context;
        mSharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
    }

    private boolean isFirstRun(String key) {
        boolean isFirstRun = mSharedPrefs.getBoolean(key, true);
        if (isFirstRun) {
            mSharedPrefs.edit().putBoolean(key, false).apply();
        }
        return isFirstRun;
    }

    private void saveFirstRun(String key) {
        mSharedPrefs.edit().putBoolean(key, true).apply();
    }

    public void onBootCompleted() {

        tweakActivityManagerSettings();
        writeAnimationSettings();
    }


    private void runCmd(String cmd) {
        try {
            Runtime.getRuntime().exec(cmd);
            Thread.sleep(1000);
        } catch (Exception e) {
            Log.e(TAG, e.toString());
        }
    }

    private void tweakActivityManagerSettings() {
        final Properties properties = new Properties.Builder("activity_manager")
                .setInt("max_cached_processes", 96)
                .setInt("max_phantom_processes", 2147483647)
                .setBoolean("use_compaction", true)
                .setInt("compact_action_1", 2)
                .setInt("compact_action_2", 2)
                .setBoolean("use_oom_re_ranking", true)
                .setString("imperceptible_kill_exempt_proc_states", "0,1,2,4,12,14")
                .build();

        try {
            DeviceConfig.setProperties(properties);
        } catch( Exception e) {
            e.printStackTrace();
        }
    }

     private void writeAnimationSettings() {
        Settings.Global.putString(mContext.getContentResolver(),
                Settings.Global.WINDOW_ANIMATION_SCALE, "0.7");
        Settings.Global.putString(mContext.getContentResolver(),
                 Settings.Global.TRANSITION_ANIMATION_SCALE, "0.7");
        Settings.Global.putString(mContext.getContentResolver(),
                 Settings.Global.ANIMATOR_DURATION_SCALE, "0.8");
     }
    
}
