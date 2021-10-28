<?php

namespace Customize\Entity;

use Doctrine\ORM\Mapping as ORM;
use Eccube\Annotation\EntityExtension;

/**
 * @EntityExtension("Eccube\Entity\Tag")
 */
trait TagTrait
{
    /**
     * @var int
     *
     * @ORM\Column(name="group_no", type="smallint", nullable=true, options={"unsigned":true})
     */
    protected $group_no;

    /**
     * Set group_no.
     *
     * @param int|null $group_no
     *
     * @return self
     */
    public function setGroupNo(?int $group_no): self
    {
        $this->group_no = $group_no;

        return $this;
    }

    /**
     * Get group_no.
     *
     * @return int|null
     */
    public function getGroupNo(): ?int
    {
        return $this->group_no;
    }
}
