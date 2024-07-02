<?php

namespace Aguud\ExportCollection\Commands;

use Illuminate\Console\Command;
use Statamic\Facades\Collection;
use Statamic\Facades\Entry;
use League\Csv\Writer;

class ExportCollectionToCsv extends Command
{
    protected $signature = 'statamic:export-collection {collection} {filename?}';
    protected $description = 'Export specific columns of a Statamic collection to CSV';

    public function handle()
    {
        $collectionHandle = $this->argument('collection');
        $filename = $this->argument('filename') ?? $collectionHandle . '.csv';

        $collection = Collection::findByHandle($collectionHandle);

        if (!$collection) {
            $this->error("Collection '{$collectionHandle}' not found.");
            return 1;
        }

        $entries = Entry::query()->where('collection', $collectionHandle)->get();

        if ($entries->isEmpty()) {
            $this->info("No entries found in collection '{$collectionHandle}'.");
            return 0;
        }

        $csv = Writer::createFromPath(storage_path('app/' . $filename), 'w+');

        // Specify the columns to export
        $columnsToExport = ['title', 'name', 'email'];

        // Add headers
        $csv->insertOne($columnsToExport);

        // Add rows
        foreach ($entries as $entry) {
            $row = [];
            foreach ($columnsToExport as $column) {
                $row[] = $entry->get($column);
            }
            $csv->insertOne($row);
        }

        $this->info("Collection '{$collectionHandle}' exported to {$filename} with columns: " . implode(', ', $columnsToExport));
        return 0;
    }
}