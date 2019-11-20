using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotate : MonoBehaviour
{
    //public float speed = 1;
    void Update()
    {
        float speed = 1;
        transform.Rotate(new Vector3(0, speed, 0));
    }
}
