<?php

namespace Aguud\ExportCollection\Actions;

use Statamic\Actions\Action;
use Illuminate\Support\Facades\Artisan;

class ExportCollectionAction extends Action
{
    protected $title = 'Export to CSV';

    public function run($items, $values)
    {
        $collection = $items->first()->collection();
        $collectionHandle = $collection->handle();
        $filename = $collectionHandle . '.csv';

        Artisan::call('statamic:export-collection', [
            'collection' => $collectionHandle,
            'filename' => $filename
        ]);

        return trans('export-collection::messages.export_completed', ['filename' => $filename]);
    }

    public function visibleTo($item)
    {
        return $item instanceof \Statamic\Entries\Entry;
    }

    public function authorize($user, $item)
    {
        return $user->can('view', $item);
    }
}