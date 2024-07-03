<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Statamic\Facades\Entry;
use Illuminate\Support\Str;

class FormController extends Controller
{
    public function submit(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            // 'captcha' => 'required|captcha'
        ]);
        
        $title = 'form-' . mt_rand(100, 9999);
        $slug = $title;
        $uri = '/'. $slug;

        $entry = Entry::make()
            ->collection('forms')
            ->slug($slug) 
            ->data([
                'title' => $title,
                'name' => $validated['name'],
                'email' => $validated['email'],
                // 'captcha' => $validated['captcha'],
            ]);

        $entry->save();

        return redirect()->back()->with('success', 'Form submitted successfully!');

    }

    public function reloadCaptcha()
    {
        return response()->json(['captcha' => captcha_img()]);
    }

    public function addComment(Request $request, $id)
    {
        $validated = $request->validate([
            'username' => 'required|string|max:255',
            'comment' => 'required|string',
        ]);

        $entry = Entry::find($id);

        if (!$entry) {
            return redirect()->back()->with('error', 'Entry not found.');
        }

        $comments = $entry->get('comments', []);
        
        $comments[] = [
            'id' => uniqid(),
            'username' => $validated['username'],
            'comment' => $validated['comment'],
            'timestamp' => now()->toDateTimeString(),
            'type' => 'new_set',
            'enabled' => true
        ];

        $entry->set('comments', $comments);
        $entry->save();

        return redirect()->back()->with('success', 'Comment added successfully!');
    }

}
