<?php

class Mastericd10 extends \Phalcon\Mvc\Model
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
     * @Column(type="string", length=6, nullable=true)
     */
    public $kodeicd10;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $namaicd10;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $keteranganicd10;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=true)
     */
    public $flag_active;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $date_added;

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
        return 'mastericd10';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Mastericd10[]|Mastericd10
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Mastericd10
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
