<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Statamic\Facades\Entry;

class FormController extends Controller
{
    public function submit(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'captcha' => 'required|captcha'
        ]);
        
        // Get current date and time formatted as 'Y-m-d H:i:s'
        $currentDateTime = (new \DateTime())->format('Y-m-d H:i:s');

        $entry = Entry::make()
            ->collection('forms')
            ->data([
                'title' => $currentDateTime,
                'name' => $validated['name'],
                'email' => $validated['email'],
                'captcha' => $validated['captcha'],
            ]);

        $entry->save();

        return redirect()->back()->with('success', 'Form submitted successfully!');

    }

    public function reloadCaptcha()
    {
        return response()->json(['captcha' => captcha_img()]);
    }

}
