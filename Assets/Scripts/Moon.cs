using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Moon : MonoBehaviour
{
    [SerializeField] GameObject Earth;
    [SerializeField] float speed = 50;

    void Update()
    {
        transform.RotateAround(Earth.transform.position, Vector3.down, speed * Time.deltaTime);

    }
}
