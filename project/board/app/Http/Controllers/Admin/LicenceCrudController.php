<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\LicenceRequest;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class LicenceCrudController
 * @package App\Http\Controllers\Admin
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class LicenceCrudController extends CrudController
{
    use \Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
    //use \Backpack\CRUD\app\Http\Controllers\Operations\BulkDeleteOperation;

    /**
     * Configure the CrudPanel object. Apply settings to all operations.
     *
     * @return void
     */
    public function setup()
    {
        CRUD::setModel(\App\Models\Licence::class);
        CRUD::setRoute(config('backpack.base.route_prefix') . '/licence');
        CRUD::setEntityNameStrings('лицензию', 'лицензии');

        if (!backpack_user()->hasRole('admin')) {
            CRUD::denyAccess(['update', 'create', 'delete']);
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
        $this->crud->addColumn([
            'name' => 'user',
            'label' => 'Организатор',
            'attribute' => 'email',
            'searchLogic' => function ($query, $column, $searchTerm) {
                $query->whereHas('user', function ($q) use ($column, $searchTerm) {
                    $q->where('email', 'like', '%'.$searchTerm.'%');
                });
            }
        ]);
        $this->crud->addColumn([
            'name' => 'licence_type_id',
            'type' => 'select',
            'entity' => 'licenceType',
            'label' => 'Тип лицензии',
            'searchLogic' => false
        ]);
        CRUD::column('start_at')->type('datetime')->label('Старт');
        CRUD::column('end_at')->type('datetime')->label('Конец');
        CRUD::column('active')->type('check')->label('Активна');

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
        CRUD::setValidation(LicenceRequest::class);

        CRUD::field('user_id')->label('Организатор');
        $this->crud->addField([
            'name' => 'licence_type_id',
            'type' => 'select',
            'entity' => 'licenceType',
            'label' => 'Тип лицензии'
        ]);
        $this->crud->addField([
            'name' => 'pupils',
            'type' => 'select2_multiple',
            'label' => 'Участники'
            // 'entity' => 'pupils',
            // 'pivot' => true
        ]);
        CRUD::field('start_at')->label('Старт');
        CRUD::field('end_at')->label('Конец');
        CRUD::field('active')->label('Активна');

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
