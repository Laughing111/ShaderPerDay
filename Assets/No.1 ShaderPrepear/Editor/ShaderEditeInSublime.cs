using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System;

public class ShaderEditeInSublime : MonoBehaviour {

    [UnityEditor.Callbacks.OnOpenAsset]
	 public static bool OpenInSub(int instanceID,int line)
    {
        string strFilePath = AssetDatabase.GetAssetPath(EditorUtility.InstanceIDToObject(instanceID));
        string strFileName = System.IO.Directory.GetParent(Application.dataPath) + "/" + strFilePath;

        if(strFileName.EndsWith(".shader"))
        {
            string strSubLimeTextPath = Environment.GetEnvironmentVariable("SublimeText_Path");
            if(strSubLimeTextPath!=null)
            {
                System.Diagnostics.Process process = new System.Diagnostics.Process();
                System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo();
                startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
                startInfo.FileName = strSubLimeTextPath + (strSubLimeTextPath.EndsWith("/") ? "" : "/") + "sublime_text.exe";
                startInfo.Arguments = "\"" + strFileName + "\"";
                process.StartInfo = startInfo;
                process.Start();
                return true;
            }
            else
            {
                Debug.Log("Not Found Enviroment Variable 'SublimeText_Path'.");
                return false;
            }
        }
        
            return false;
    }
}
