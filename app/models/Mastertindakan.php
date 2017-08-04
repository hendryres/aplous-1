<?php

class Mastertindakan extends \Phalcon\Mvc\Model
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
     * @Column(type="string", length=50, nullable=false)
     */
    public $liid;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $linkid;

    /**
     *
     * @var integer
     * @Column(type="integer", length=50, nullable=false)
     */
    public $namatindakan;

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
        return 'mastertindakan';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Mastertindakan[]|Mastertindakan
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Mastertindakan
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
