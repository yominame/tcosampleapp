<?php

namespace App\Controllers;

class KeyvaultTest extends BaseController
{
    public function index()
    {
        // Read the secret from environment variable
        $secret = env('DATABASE_PASSWORD');

        // Pass it to the view
        return view('keyvault_view', ['secret' => $secret]);
    }
}
