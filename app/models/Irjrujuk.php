<?php

class Irjrujuk extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $rm;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $instalasi;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $poli;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $nosep;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $dokter;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $tanggal;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("aplous_data");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'irjrujuk';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Irjrujuk[]|Irjrujuk
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Irjrujuk
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
