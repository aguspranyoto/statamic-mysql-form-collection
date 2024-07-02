<?php

namespace Aguud\ExportCollection;

use Statamic\Providers\AddonServiceProvider;
use Aguud\ExportCollection\Actions\ExportCollectionAction;
use Aguud\ExportCollection\Commands\ExportCollectionToCsv;

class ServiceProvider extends AddonServiceProvider
{
    protected $actions = [
        ExportCollectionAction::class,
    ];

    protected $commands = [
        ExportCollectionToCsv::class,
    ];

    public function bootAddon()
    {
        //
    }
}