using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Earth : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        float val = Mathf.PingPong(Time.time, 1);
        GetComponent<Renderer>().material.SetFloat("_TexValue", val);
    }
}
