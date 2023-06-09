<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\RequestRequest;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class RequestCrudController
 * @package App\Http\Controllers\Admin
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class RequestCrudController extends CrudController
{
    use \Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\BulkDeleteOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;

    /**
     * Configure the CrudPanel object. Apply settings to all operations.
     *
     * @return void
     */
    public function setup()
    {
        CRUD::setModel(\App\Models\Request::class);
        CRUD::setRoute(config('backpack.base.route_prefix') . '/request');
        CRUD::setEntityNameStrings('приглашение', 'приглашения');

        $this->crud->denyAccess(['create','update','delete','show','bulkDelete']);
        if( !backpack_user()->hasRole('user') ) {
            $this->crud->allowAccess(['update','bulkDelete']);
        }



    }

    /**
     * Define what happens when the List operation is loaded.
     *
     * @see  https://backpackforlaravel.com/docs/crud-operation-list-entries
     * @return void
     */
    protected function setupListOperation()
    {

        CRUD::column('owner_id')->label('Организатор');
        if( ! backpack_user()->hasRole('user') ) {
            CRUD::column('user_id')->label('Участник');
        }
        $this->crud->addColumn([
            'name' => 'status',
            'label' => 'Статус',
            'wrapper' => [
                'element' => 'span',
                'class' => function ($crud, $column, $entry, $related_key) {
                    if ($column['text'] == 'accepted') {
                        return 'badge badge-success';
                    }
                    if ($column['text'] == 'ignored') {
                        return 'badge badge-error';
                    }

                    return 'badge badge-default';
                },
            ],
        ]);

        CRUD::column('created_at')->label('Дата');
        if( ! backpack_user()->hasRole('user') ) {
            CRUD::column('link')->attribute('slug')->label('Код приглашения');
            CRUD::column('updated_at')->label('Обновлен');
            $this->crud->addButtonFromView('line', 'accept', 'accept', 'beginning');
            $this->crud->removeButton('update');
        }


        /**
         * Columns can be defined using the fluent syntax or array syntax:
         * - CRUD::column('price')->type('number');
         * - CRUD::addColumn(['name' => 'price', 'type' => 'number']);
         */
    }

    /**
     * Define what happens when the Create operation is loaded.
     *
     * @see https://backpackforlaravel.com/docs/crud-operation-create
     * @return void
     */
    protected function setupCreateOperation()
    {
        CRUD::setValidation(RequestRequest::class);

        CRUD::field('owner_id');
        CRUD::field('user_id');
        CRUD::field('link_id');
        $this->crud->addField([
            'name' => 'status',
            'type' => 'enum'
        ]);

        /**
         * Fields can be defined using the fluent syntax or array syntax:
         * - CRUD::field('price')->type('number');
         * - CRUD::addField(['name' => 'price', 'type' => 'number']));
         */
    }

    /**
     * Define what happens when the Update operation is loaded.
     *
     * @see https://backpackforlaravel.com/docs/crud-operation-update
     * @return void
     */
    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();
    }
}
